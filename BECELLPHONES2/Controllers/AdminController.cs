
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
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
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

                context.SaveChanges();


                // trả về cái respones
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve
                };

                string json = System.Text.Json.JsonSerializer.Serialize(product, options);

                return Ok(json);
            }
            catch (Exception ex)
            {
                return Ok(new { message = "Lỗi " + ex.Message, value = 0 });
            }

        }



        // hàm xử lý xóa theo id sản phẩm
        [HttpDelete("Admin/deleteProduct/{id}")]
        public IActionResult DeleteProduct(int id)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.DeleteProduct(id);
                if (sta == -1)
                {
                    return Ok(new { message = "Lỗi ", value = 0 });
                }
                if (sta == 2)
                {
                    return Ok(new { message = "không tìm thấy", value = 2 });
                }
                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
            return Ok(new { message = "Lỗi ", value = 0 });
        }


        //Api get information off product wwith id
        [HttpGet("Admin/getInforProduct/{id}")]
        public IActionResult GetInforProduct(int id)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                var data = sv.GetInforProduct(id);
                string json = JsonConvert.SerializeObject(data);
                return Ok(json);
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
                return Ok(new { message = "Lỗi " + ex.Message, value = 0 });
            }

        }


        //APi usse to update product
        [HttpPost("Admin/updateProduct/")]
        public IActionResult UpdateProduct([FromBody] ProductAlias productAlias)
        {
            try
            {

                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.UpdateProduct(productAlias);
                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
                else
                {
                    throw new Exception("Gặp lỗi rồi ");
                }
            }
            catch (Exception ex)
            {
                return Ok(new { message = "Lỗi " + ex.Message, value = 0 });
            }

        }

        /// <summary>
        /// ////////////////////////////////Product Color
        /// </summary>
        /// <param name="idpc"></param>
        /// <returns></returns>
        //API usse to get information of product color with id
        [HttpGet("Admin/getProductColor/{idpc}")]
        public IActionResult GetProductColor(int idpc)
        {
            //id là id pc
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);

                CellphoneappProductColor productColor = sv.GetProductColor(idpc);
                if (productColor == null)
                {
                    throw new Exception("Khong tim thay");
                }
                return Ok(productColor);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Ok(new { message = "Lỗi " + ex.Message, value = 0 });
            }
        }

        [HttpGet("Admin/getProductColor-Product/{idpc}")]
        public IActionResult GetProductColorProduct(int idpc)
        {
            //id là id pc
            try
            {
                // get infor Pc
                CellphoneappProductColor productColor = context.CellphoneappProductColors.Find(idpc);
                if (productColor == null)
                {
                    return BadRequest();
                }
                // get infor P
                CellphoneappProduct product = context.CellphoneappProducts.Find(productColor.IdProductId);

                var data = new Dictionary<string, object>();
                data["nameProduct"] = product.Name;
                data["color"] = productColor.NameColorId;
                data["price"] = productColor.Price;
                return Ok(data);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Ok(new { message = "Lỗi " + ex.Message, value = 0 });
            }
        }



        [HttpDelete("Admin/deleteProductColor/{idpc}")]
        public IActionResult DeleteProductColor(int idpc)
        {

            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.DeleteProductColor(idpc);
                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
                if(sta == 2)
                {
                    return Ok(new { message = "Không tìm thấy", value = 2 });
                }
                if (sta == -1)
                {
                    return Ok(new { message = "Lỗi " , value = 0 }); ;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
               
            }
            return Ok(new { message = "Lỗi ", value = 0 });
        }

        //Api add product -- color
        [HttpPost("Admin/addProductColor/")]
        public IActionResult AddProductColor([FromBody] ProductColorAlias productColorAlias)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine($"from vo la {productColorAlias}");


                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.AddProductColor(productColorAlias);
                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
                else
                {
                    throw new Exception("Khong thanh cong");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Ok(new { message = "Khong thanh cong ", value = 0 });

            }

        }


        //api update product color
        [HttpPost("Admin/updateProductColor/")]
        public IActionResult UpdateProductColor([FromBody] ProductColorAlias productColorAlias)
        {
            try
            {


                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.UpdateProductColor(productColorAlias);
                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
                else
                {
                    throw new Exception("Khong thanh cong");
                }
            } catch (Exception ex)
            {
                return Ok(new { message = "Khong thanh cong ", value = 0 });
            }
        }


        ///////// ProductColro - branch
        /// <summary>
         // API get Infor Of A Product Color In Branch
        [HttpGet("Admin/getInforOfAProductColorInBranch/{idbppc}")]
        public IActionResult GetInforOfAProductColorInBranch(int idbppc)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                var data = sv.GetInforOfAProductColorInBranch(idbppc);
                // check it have value ?
                if(data == null)
                {
                    return Ok(new { message = "Khong thanh cong ", value = 0 });
                }    
                return Ok(data);
                
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Ok(new { message = "Khong thanh cong ", value = 0 });
            }

        }


        [HttpPost("Admin/addInforOfAProductColorInBranch/")]
        public IActionResult AddInforOfAProductColorInBranch([FromBody]  BranchProductColorAlias branchProductColorAlias)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.AddInforOfAProductColorInBranch(branchProductColorAlias);
                return Ok(new { message = "Thành công", value = 1 });

            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Ok(new { message = "Khong thanh cong ", value = 0 });
            }
        }



        // API delete BPPC
        [HttpDelete("Admin/deleteInforOfAProductColorInBranch/{idBPPC}")]
        public IActionResult DeleteInforOfAProductColorInBranch(int idBPPC)
        {

            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                int sta = sv.DeleteInforOfAProductColorInBranch(idBPPC);
                if(sta == 0)
                {
                    return Ok(new { message = "Khong thanh cong ", value = 0 });
                }    
                if(sta == 2)
                {
                    return Ok(new { message = "Khong tìm thấy ", value = 2 });
                }

                if (sta == 1)
                {
                    return Ok(new { message = "Thành công", value = 1 });
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return Ok(new { message = "Khong thanh cong ", value = 0 });

        }



        //API get all customer
        [HttpGet("Admin/getAllCustomer/")]
        public IActionResult GetAllCustomer()
        {
            List <CellphoneappUser> data = context.CellphoneappUsers.ToList();
            if(data.Count == 0)
            {
                return Ok(new { message = "Khong tìm thấy ", value = 2 });
            }

            return Ok(data);
        }

        //API get all product
        [HttpGet("Admin/getProduct/")]
        public IActionResult GetProduct()
        {
            List<CellphoneappProduct> data = context.CellphoneappProducts.ToList();
            if (data.Count == 0)
            {
                return Ok(new { message = "Khong tìm thấy ", value = 2 });
            }

            return Ok(data);
        }

        //API get all product-color
        [HttpGet("Admin/getProductColor/")]
        public IActionResult GetProductColor()
        {

            try
            {

                List<object[]> rows = new List<object[]>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(@"
              select * from cellphoneapp_product p, cellphoneapp_product_color pc
                where p.Id = pc.idProduct_id

                ", connection))
                    {
                       
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                object[] rowValues = new object[reader.FieldCount];

                                // Loop through the columns in the row and add each value to the array
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    rowValues[i] = reader.GetValue(i);
                                }

                                // Add the array to the list of results
                                rows.Add(rowValues);
                            }
                        }
                    }
                }


                // lúc nài row đang gio giá trị 
                List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
                foreach (var row in rows)
                {
                    var d = new Dictionary<string, object>();
                    d["IdProduct"] = row[0];
                    d["nameProduct"] = row[1];
                    d["nameManufacture"] = row[2];
                    d["type"] = row[3];
                    d["IdPC"] = row[4];
                    d["price"] = row[5];
                    d["nameColor"] = row[7];

                    data.Add(d);
                }


                return Ok(data);

            }
            catch (Exception ex)
            {
                return null;
            }

        }



        //API get all branch- product-color
        [HttpGet("Admin/getBranchProductColor/")]
        public IActionResult GetBranchProductColor()
        {

            try
            {

                List<object[]> rows = new List<object[]>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(@"
                select bpc.Id, bpc.idBranch_id,p.Name,pc.nameColor_id,pc.Price,p.Type,bpc.Amount from cellphoneapp_product p, cellphoneapp_product_color pc ,cellphoneapp_branch_product_color bpc
                where p.Id = pc.idProduct_id
                and pc.Id = bpc.idProductColor_id

                ", connection))
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                object[] rowValues = new object[reader.FieldCount];

                                // Loop through the columns in the row and add each value to the array
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    rowValues[i] = reader.GetValue(i);
                                }

                                // Add the array to the list of results
                                rows.Add(rowValues);
                            }
                        }
                    }
                }


                // lúc nài row đang gio giá trị 
                List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
                foreach (var row in rows)
                {
                    var d = new Dictionary<string, object>();
                    d["idBPC"] = row[0];
                    d["idBranch"] = row[1];
                    d["nameProduct"] = row[2];
                    d["nameColor"] = row[3];
                    d["price"] = row[4];
                    d["type"] = row[5];
                    d["amount"] = row[6];

                    data.Add(d);
                }


                return Ok(data);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }




    }
}
