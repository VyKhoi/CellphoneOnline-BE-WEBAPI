
using BECELLPHONES2.Entities;
using BECELLPHONES2.Alias;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Stripe;
using Microsoft.EntityFrameworkCore;
using Org.BouncyCastle.Crypto.Generators;
using BCrypt.Net;
using Microsoft.AspNetCore.Identity;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using BECELLPHONES2.Service;

namespace BECELLPHONES2.Controllers
{
    public class AdminController : ControllerBase
    {
        private readonly CellphonesContext context;
        private readonly String connectionString = "Data Source=VYKHOI\\VYKHOI;Initial Catalog=cellphones;Integrated Security=True;TrustServerCertificate=True";

        public AdminController(CellphonesContext ctx)
        {
            context = ctx;
        }


        // hàm xử lý code thêm sản phẩm
        [HttpPost("Admin/addProduct/")]
        public IActionResult AddProduct([FromBody] ProductAlias productAlias)
        {
            try
            {
                // lưu sản phẩm
                CellphoneappProduct product = new CellphoneappProduct()
                {
                    Name = productAlias.Name,
                    Type = productAlias.Type,
                    NameManufactureId = productAlias.Manufacture,
                };

                context.CellphoneappProducts.Add(product);
                context.SaveChanges();

                // lưu hình ảnh
                for (int i = 0; i < productAlias.Images.Count; i++)
                {
                    CellphoneappImageproduct imageproduct = new CellphoneappImageproduct()
                    {
                        Name = productAlias.Images[i].NameImage,
                        LinkImg = productAlias.Images[i].Images,
                        IdProductId = product.Id
                    };
                    context.CellphoneappImageproducts.Add(imageproduct);
                    context.SaveChanges();
                }

                // lưu introduce cho sản phẩm

                CellphoneappReview review = new CellphoneappReview()
                {
                    Title = productAlias.Title,
                    Content = productAlias.Content,
                    IdProductId = product.Id
                };
                context.CellphoneappReviews.Add(review);
                context.SaveChanges();
                // lưu các thông số sản phẩm

                if (productAlias.Type == "laptop")
                {
                    ProductServiceAdmin padmin = new ProductServiceAdmin(context);
                    int rs = padmin.AddProductLaptop(product, productAlias);

                    if (rs == 0)
                    {
                        throw new Exception("Khong thanh cong");
                    }
                }

                if (productAlias.Type == "phone")
                {
                    ProductServiceAdmin padmin = new ProductServiceAdmin(context);
                    int rs = padmin.AddProductPhone(product, productAlias);

                    if (rs == 0)
                    {
                        throw new Exception("Khong thanh cong");
                    }
                }



                // trả về cái respones
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve
                };

                string json = System.Text.Json.JsonSerializer.Serialize(product, options);

                return Ok(json);
            }catch (Exception ex)
            {
                return null;
            }

        }
    }
}
