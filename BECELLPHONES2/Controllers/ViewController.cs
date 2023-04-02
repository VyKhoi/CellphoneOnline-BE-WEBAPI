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

namespace BECELLPHONES2.Controllers
{
    //[Route("api/[controller]")]
    [ApiController]
    public class ViewsController : ControllerBase
    {
        private readonly CellphonesContext context;
        private readonly String connectionString = "Data Source=VYKHOI\\VYKHOI;Initial Catalog=cellphones;Integrated Security=True;TrustServerCertificate=True";

        public ViewsController(CellphonesContext ctx)
        {
            context = ctx;
        }

        // get detail of a product
        [HttpGet("home/branch/{branchId}/product/{productId}")]
        public IActionResult GetDetailProduct(int branchId, int productId)
        {
            var pro = context.CellphoneappProducts.FirstOrDefault(x => x.Id == productId);
            string table = "";
            string operatorSystem = "";
            if (pro.Type == "phone")
            {
                table = "cellphoneapp_smartphone";
                operatorSystem = "Operator_System";
            }
            else if (pro.Type == "laptop")
            {
                table = "cellphoneapp_laptop";
                operatorSystem = "operatorSystem";
            }
            else
            {
                table = "unknown_table";
            }
            List<object[]> results = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
            SELECT  pc.Id AS ProductColorId, pc.idProduct_id AS productID, pc.Price, pc.nameColor_id as mau_cua_san_pham, bpp.discountRate, p.timeStart, p.timeEnd, bp.Amount, b.Name AS branch_name, p2.Name AS product_name, m.names AS manufacturer_name, i.linkImg, r.Title AS review_title, r.Content AS review_content, s." + operatorSystem + @", s.CPU, s.RAM, s.ROM, s.Battery, s.Others, bpc.Amount, i.Name as name_cua_anh, bp.Id
            FROM cellphoneapp_promotion p 
            JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
            JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
            JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
            JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
            JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
            JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
            LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
            LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
            LEFT JOIN " + table + @" s ON p2.Id = s.product_ptr_id 
            JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
            WHERE b.Id = @branchId AND s." + operatorSystem + " IS NOT NULL and p2.Id = @productId and pc.nameColor_id like i.Name and p.Active = 1", connection))
                {
                    command.Parameters.AddWithValue("@branchId", branchId);
                    command.Parameters.AddWithValue("@productId", productId);

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
                            results.Add(rowValues);
                        }
                    }
                }
            }

            if (results.Count == 0)
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (var command = new SqlCommand(@"        select pc.Id,MAX(pc.idProduct_id) as product_id,MAX(pc.Price),MAX(pc.nameColor_id),MAX(p.Name), MAX(p.nameManufacture_id),
		                        MAX(image.linkImg),	MAX(r.Title),MAX(r.Content),MAX(s." + operatorSystem + @"),MAX(s.CPU),MAX(s.RAM),
		                        MAX(s.ROM),MAX(s.Battery),MAX(s.Others),MAX(bpc.Amount),MAX(image.Name) as namecuaanh ,
		                        MAX(bpc.Id) from cellphoneapp_product p,cellphoneapp_product_color pc, cellphoneapp_branch_product_color bpc,cellphoneapp_imageproduct image, cellphoneapp_review,cellphoneapp_review r," + table + @" s
                                                where p.Id = pc.idProduct_id and
                                                pc.Id = bpc.idProductColor_id
                                                and p.id = s.product_ptr_id 
                                                and p.id = image.idProduct_id
                                                and p.id = r.idProduct_id
                                                and bpc.idBranch_id = @branch_id and p.Id = @product_id and pc.nameColor_id like image.Name
                                                group by pc.Id", connection))
                    {
                        command.Parameters.AddWithValue("@branch_id", branchId);
                        command.Parameters.AddWithValue("@product_id", productId);

                        using (var reader = command.ExecuteReader())
                        {

                            while (reader.Read())
                            {
                                var row = new object[reader.FieldCount];
                                reader.GetValues(row);
                                results.Add(row);
                            }

                        }
                    }
                }
                //Console.WriteLine("rows mới trả về khi mà nó không có khuyến mãi " + results[0][4], results);
                Console.WriteLine("rows mới trả về khi mà nó không có khuyến mãi {0}", results.Count);
                var name_TMP = results[0][4];

                Console.WriteLine("Hello World", name_TMP);








                var pb = new List<object[]>();
                // lấy phiên bản 
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(@" SELECT MAX(pc.Id), MAX(pc.idProduct_id) AS product_id, MAX(pc.Price), MAX(pc.nameColor_id), 
               MAX(p.Name), MAX(p.nameManufacture_id), MAX(image.linkImg), MAX(r.Title), MAX(r.Content), 
               MAX(s." + operatorSystem + @"), MAX(s.CPU), MAX(s.RAM), MAX(s.ROM), MAX(s.Battery), MAX(s.Others), MAX(bpc.Amount), 
               MAX(image.Name) AS namecuaanh, MAX(bpc.Id) 
                FROM cellphoneapp_product p, cellphoneapp_product_color pc, cellphoneapp_branch_product_color bpc, 
                     cellphoneapp_imageproduct image, cellphoneapp_review, cellphoneapp_review r, " + table + @" s
                WHERE p.Id = pc.idProduct_id 
                    AND pc.Id = bpc.idProductColor_id 
                    AND p.id = s.product_ptr_id 
                    AND p.id = image.idProduct_id 
                    AND bpc.idBranch_id = @branchId
                    AND p.Name = @productName
                    AND pc.nameColor_id LIKE image.Name
                GROUP BY pc.idProduct_id", connection))
                    {
                        command.Parameters.AddWithValue("@branchId", branchId);
                        command.Parameters.AddWithValue("@productName", name_TMP);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                var row = new object[reader.FieldCount];
                                reader.GetValues(row);
                                pb.Add(row);
                            }
                        }
                    }
                }


                // chuyển về json hợp lý
                List<Dictionary<string, object>> options = new List<Dictionary<string, object>>();
                foreach (var i in pb)
                {
                    Dictionary<string, object> tmp = new Dictionary<string, object>();
                    tmp["idProduct"] = i[1];
                    tmp["ram"] = i[11];
                    tmp["rom"] = i[12];
                    options.Add(tmp);
                }
                Console.WriteLine("thong so phien bangggggggg moi", pb);

                List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
                List<Dictionary<string, object>> color = new List<Dictionary<string, object>>();
                foreach (var i in results)
                {
                    Dictionary<string, object> cl = new Dictionary<string, object>();
                    cl["id_branch_product_color"] = i[17];
                    cl["color"] = i[3];
                    cl["price"] = i[2];
                    color.Add(cl);
                }
                Console.WriteLine("xan pham nay co id mau laaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa moi ", name_TMP);
                foreach (var row in results)
                {
                    System.Diagnostics.Debug.WriteLine(string.Format("vao dong dầu"));
                    Console.WriteLine("moi dong laaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", row);
                    // luu cac hinh anh
                    List<Dictionary<string, object>> image = new List<Dictionary<string, object>>();
                    Dictionary<string, object> d = new Dictionary<string, object>();



                    for (int k = 0; k < results.Count; k++)
                    {
                        System.Diagnostics.Debug.WriteLine(string.Format("id là {0} == {1}, do day mang {2}", results[k][1], row[1], results.Count));
                        if (results[k][1].ToString() == row[1].ToString())
                        {
                            Dictionary<string, object> imageProduct = new Dictionary<string, object>();
                            imageProduct["name"] = results[k][16];
                            imageProduct["link"] = results[k][6];
                            image.Add(imageProduct);
                            System.Diagnostics.Debug.WriteLine(string.Format("nó có xuất màu ra la{0}, id là {1} == {2}", imageProduct["name"], results[k][1], row[1]));

                            foreach (var v in image)
                            {
                                System.Diagnostics.Debug.WriteLine(string.Format("Tên ảnh: {0}, đường dẫn: {1}", v["name"], v["link"]));
                            }
                        }

                    }

                    //foreach (var imageProduct in image)
                    //{
                    //    System.Diagnostics.Debug.WriteLine(string.Format("Tên ảnh: {0}, đường dẫn: {1}", imageProduct["name"], imageProduct["link"]));
                    //}


                    d["image"] = image;
                    d["id"] = row[1];
                    d["name"] = row[4];
                    d["nameManufacture"] = row[5];
                    d["price"] = row[2];

                    d["currentPrice"] = row[2];
                    d["id_product_color"] = row[0];
                    d["name_color_id"] = row[3];
                    d["image_link"] = row[6];
                    d["reviewTitle"] = row[7];
                    d["introduce"] = row[8];
                    d["operatorSystem"] = row[9];
                    d["CPU"] = row[10];
                    d["RAM"] = row[11];
                    d["ROM"] = row[12];
                    d["Battery"] = row[13];
                    d["Others"] = row[14];
                    d["amount"] = row[15];
                    d["options"] = options;
                    d["color"] = color;

                    data.Add(d);
                }

                string json2 = JsonConvert.SerializeObject(data);
                return Ok(json2);



            }
            else
            {
                var name_TMP = results[0][9];

                var pb = new List<object[]>();
                // lấy phiên bản 
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(@"SELECT
                        MAX(pc.Id) AS ProductColorId,
                        pc.idProduct_id AS productID,
                       
                        MAX(pc.Price) AS Price,
                        MAX(pc.nameColor_id) AS mau_cua_san_pham,
                        MAX(bpp.discountRate) AS discountRate,
                        MAX(p.timeStart) AS timeStart,
                        MAX(p.timeEnd) AS timeEnd,
                        MAX(bp.Amount) AS Amount,
                        MAX(b.Name) AS branch_name,
                        MAX(p2.Name) AS product_name,
                        MAX(m.names) AS manufacturer_name,
                        MAX(i.linkImg) AS linkImg,
                        MAX(r.Title) AS review_title,
                        MAX(r.Content) AS review_content,
                        MAX(s." + operatorSystem + @") as " + operatorSystem + @",
                        MAX(s.CPU) AS CPU,
                        MAX(s.RAM) AS RAM,
                        MAX(s.ROM) AS ROM,
                        MAX(s.Battery) AS Battery,
                        MAX(s.Others) AS Others,
                        MAX(bpc.Amount) AS bpc_Amount,
                        MAX(i.Name) AS name_cua_anh
                            FROM cellphoneapp_promotion p 
                            JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
                            JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
                            JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
                            JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
                            JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
                            JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
                            LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
                            LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
                            LEFT JOIN " + table + @" s ON p2.Id = s.product_ptr_id 
                            JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
                            WHERE b.Id = @branchId AND s." + operatorSystem + @" IS NOT NULL and p2.Name like @productName and pc.nameColor_id like i.Name and p.Active = 1
                            GROUP BY pc.idProduct_id
                           

                        ", connection))
                    {
                        command.Parameters.AddWithValue("@branchId", branchId);
                        command.Parameters.AddWithValue("@productName", name_TMP);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                var row = new object[reader.FieldCount];
                                reader.GetValues(row);
                                pb.Add(row);
                            }
                        }
                    }
                }

                // parse ve json hop ly
                List<Dictionary<string, object>> options = new List<Dictionary<string, object>>();
                foreach (var i in pb)
                {
                    Dictionary<string, object> tmp = new Dictionary<string, object>();
                    tmp["idProduct"] = i[1];
                    tmp["ram"] = i[16];
                    tmp["rom"] = i[17];
                    options.Add(tmp);
                }

                List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
                List<Dictionary<string, object>> color = new List<Dictionary<string, object>>();
                foreach (object[] i in results)
                {
                    Dictionary<string, object> cl = new Dictionary<string, object>();
                    cl["id_branch_product_color"] = i[22];
                    cl["color"] = i[3];
                    cl["price"] = i[2];
                    color.Add(cl);
                }
                Console.WriteLine("xan pham nay co id mau laaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + results[0][0]);

                foreach (object[] row in results)
                {
                    Console.WriteLine("moi dong laaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa: " + row);
                    List<object> image = new List<object>();
                    foreach (object[] i in results)
                    {
                        Console.WriteLine("chay");
                        if (i[1].ToString() == row[1].ToString())
                        {
                            Dictionary<string, object> imageProduct = new Dictionary<string, object>();
                            imageProduct["name"] = i[21];
                            imageProduct["link"] = i[11];
                            image.Add(imageProduct);
                        }
                    }

                    Dictionary<string, object> d = new Dictionary<string, object>();
                    d["image"] = image;
                    d["branch_name"] = row[0];
                    d["id"] = row[1];
                    d["name"] = row[9];
                    d["nameManufacture"] = row[10];
                    d["price"] = row[2];
                    d["discountRate"] = row[4];
                    d["currentPrice"] = Convert.ToDouble(row[2]) - Convert.ToDouble(row[2]) * Convert.ToDouble(row[4]);
                    d["id_product_color"] = row[0];
                    d["name_color_id"] = row[3];
                    d["image_link"] = row[11];
                    d["reviewTitle"] = row[12];
                    d["introduce"] = row[13];
                    d["operatorSystem"] = row[14];
                    d["CPU"] = row[15];
                    d["RAM"] = row[16];
                    d["ROM"] = row[17];
                    d["Battery"] = row[18];
                    d["Others"] = row[19];
                    d["amount"] = row[20];
                    d["options"] = options;
                    d["color"] = color;

                    data.Add(d);
                }
                string json = JsonConvert.SerializeObject(data);
                return Ok(json);
            }
        }

        // get promotion produc phones
        [HttpGet("home/branch/{branchId}/phones")]
        public IActionResult GetProductsPhones(int branchId)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
                SELECT     MAX(pc.Id) AS ProductColorId,
                           pc.idProduct_id AS productID, 
                           
                           MAX(pc.Price) AS Price,
                           MAX(pc.nameColor_id) AS nameColor_id,
                           MAX(bpp.discountRate) AS discountRate,
                           MAX(p.timeStart) AS timeStart,
                           MAX(p.timeEnd) AS timeEnd,
                           MAX(bp.Amount) AS Amount,
                           MAX(b.Name) AS branch_name,
                           MAX(p2.Name) AS product_name,
                           MAX(m.names) AS manufacturer_name,
                           MAX(i.linkImg) AS linkImg,
                           MAX(r.Title) AS review_title,
                           MAX(r.Content) AS review_content,
                           MAX(s.Operator_System) AS Operator_System,
                           MAX(s.CPU) AS CPU,
                           MAX(s.RAM) AS RAM,
                           MAX(s.ROM) AS ROM,
                           MAX(s.Battery) AS Battery,
                           MAX(s.Others) AS Others,
                           MAX(bpc.Amount) AS bpc_Amount,
                           MAX(bp.Id) AS Id
                    FROM cellphoneapp_promotion p 
                    JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
                    JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
                    JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
                    JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
                    JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
                    JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
                    LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
                    LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
                    LEFT JOIN cellphoneapp_smartphone s ON p2.Id = s.product_ptr_id 
                    JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
                    WHERE b.Id = @branchId AND s.Operator_System IS NOT NULL and pc.nameColor_id like i.Name and p.Active = 1
                    GROUP BY pc.idProduct_id,pc.Id

                ", connection))
                {
                    command.Parameters.AddWithValue("@branchId", branchId);

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

            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
            foreach (var row in rows)
            {
                var d = new Dictionary<string, object>();
                d["branch_name"] = row[8];
                d["id"] = row[1];
                d["name"] = row[9];
                d["nameManufacture"] = row[10];
                d["currentPrice"] = Convert.ToDouble(row[2]) - Convert.ToDouble(row[2]) * Convert.ToDouble(row[4]);

                d["price"] = row[2];
                d["discountRate"] = row[4];
                d["id_product_color"] = row[0];
                d["currentColor"] = row[3];
                d["currentImage"] = row[11];
                d["reviewTitle"] = row[12];
                d["introduce"] = row[13];
                d["operatorSystem"] = row[14];
                d["CPU"] = row[15];
                d["RAM"] = row[16];
                d["ROM"] = row[17];
                d["Battery"] = row[18];
                d["Others"] = row[19];
                d["amount"] = row[20];
                d["id_branch_product_color"] = row[21];
                data.Add(d);
            }
            // Lọc trùng các phần tử dựa trên thuộc tính "id"
            List<Dictionary<string, object>> filteredData = data
              .GroupBy(d => d["id"])
              .Select(g => g.First())
              .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
              .ToList();

            string json2 = JsonConvert.SerializeObject(filteredData);
            return Ok(json2);
        }

        [HttpGet("home/branch/{branchId}/laptops")]
        public IActionResult GetProductsLaptops(int branchId)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
                SELECT     MAX(pc.Id) AS ProductColorId,
                           pc.idProduct_id AS productID, 
                           
                           MAX(pc.Price) AS Price,
                           MAX(pc.nameColor_id) AS nameColor_id,
                           MAX(bpp.discountRate) AS discountRate,
                           MAX(p.timeStart) AS timeStart,
                           MAX(p.timeEnd) AS timeEnd,
                           MAX(bp.Amount) AS Amount,
                           MAX(b.Name) AS branch_name,
                           MAX(p2.Name) AS product_name,
                           MAX(m.names) AS manufacturer_name,
                           MAX(i.linkImg) AS linkImg,
                           MAX(r.Title) AS review_title,
                           MAX(r.Content) AS review_content,
                           MAX(s.operatorSystem) AS Operator_System,
                           MAX(s.CPU) AS CPU,
                           MAX(s.RAM) AS RAM,
                           MAX(s.ROM) AS ROM,
                           MAX(s.Battery) AS Battery,
                           MAX(s.Others) AS Others,
                           MAX(bpc.Amount) AS bpc_Amount,
                           MAX(bp.Id) AS Id
                    FROM cellphoneapp_promotion p 
                    JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
                    JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
                    JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
                    JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
                    JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
                    JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
                    LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
                    LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
                    LEFT JOIN cellphoneapp_laptop s ON p2.Id = s.product_ptr_id 
                    JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
                    WHERE b.Id = @branchId AND s.operatorSystem IS NOT NULL and pc.nameColor_id like i.Name and p.Active = 1
                    GROUP BY pc.idProduct_id,pc.Id

                ", connection))
                {
                    command.Parameters.AddWithValue("@branchId", branchId);

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

            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
            foreach (var row in rows)
            {
                var d = new Dictionary<string, object>();
                d["branch_name"] = row[8];
                d["id"] = row[1];
                d["name"] = row[9];
                d["nameManufacture"] = row[10];
                d["currentPrice"] = Convert.ToDouble(row[2]) - Convert.ToDouble(row[2]) * Convert.ToDouble(row[4]);

                d["price"] = row[2];
                d["discountRate"] = row[4];
                d["id_product_color"] = row[0];
                d["currentColor"] = row[3];
                d["currentImage"] = row[11];
                d["reviewTitle"] = row[12];
                d["introduce"] = row[13];
                d["operatorSystem"] = row[14];
                d["CPU"] = row[15];
                d["RAM"] = row[16];
                d["ROM"] = row[17];
                d["Battery"] = row[18];
                d["Others"] = row[19];
                d["amount"] = row[20];
                d["id_branch_product_color"] = row[21];
                data.Add(d);
            }
            // Lọc trùng các phần tử dựa trên thuộc tính "id"
            List<Dictionary<string, object>> filteredData = data
              .GroupBy(d => d["id"])
              .Select(g => g.First())
              .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
              .ToList();

            string json2 = JsonConvert.SerializeObject(filteredData);
            return Ok(json2);
        }

        //get all product phones
        [HttpGet("home/branch/{branchId}/total-phones")]
        public IActionResult GetProductsPhonesAll(int branchId)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
                   select  bpc.idBranch_id,pc.Id as idProduct_color, p.Id as product_id ,pc.Price,p.nameManufacture_id,pc.nameColor_id,m.Operator_System,m.CPU,m.RAM,m.ROM,m.Battery,m.Others, p.Name as tensanpham ,im.Name , im.linkImg, bpc.Amount from cellphoneapp_branch b,cellphoneapp_branch_product_color bpc ,cellphoneapp_product_color pc, cellphoneapp_product p,cellphoneapp_smartphone m,cellphoneapp_imageproduct im
                    where b.Id = bpc.idBranch_id and
		            bpc.idProductColor_id = pc.Id and
                    pc.idProduct_id = p.Id and
                    p.Id = m.product_ptr_id and 
		            p.Id = im.idProduct_id and
                    b.id = @branchId and
                    pc.nameColor_id = im.Name and
                    Operator_System is not null
  
                ", connection))
                {
                    command.Parameters.AddWithValue("@branchId", branchId);

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
            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
            foreach (var row in rows)
            {
                var d = new Dictionary<string, object>();
                d["id"] = row[2];
                d["name"] = row[12];
                d["nameManufacture"] = row[4]; // row[4] theo câu truy vấn thì nó là discount
                d["currentPrice"] = row[3];
                d["id_product_color"] = row[1];
                d["currentColor"] = row[5];
                d["currentImage"] = row[14];
                d["operatorSystem"] = row[6];
                d["CPU"] = row[7];
                d["RAM"] = row[8];
                d["ROM"] = row[9];
                d["Battery"] = row[10];
                d["Others"] = row[11];
                d["amount"] = row[15];
                data.Add(d);
            }
            List<Dictionary<string, object>> filteredData = data
            .GroupBy(d => d["id"])
            .Select(g => g.First())
            .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
            .ToList();

            string json2 = JsonConvert.SerializeObject(filteredData);
            return Ok(json2);



        }


        [HttpGet("home/branch/{branchId}/total-laptops")]
        public IActionResult GetProductsLaptopsAll(int branchId)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
                  SELECT 
                        bpc.idBranch_id,
                        pc.Id AS idProduct_color,
                        p.Id AS product_id,
                        MAX(pc.Price) AS Price,
                        MAX(p.nameManufacture_id) AS nameManufacture_id,
                        MAX(pc.nameColor_id) AS nameColor_id,
                        MAX(l.operatorSystem) AS operatorSystem,
                        MAX(l.CPU) AS CPU,
                        MAX(l.RAM) AS RAM,
                        MAX(l.ROM) AS ROM,
                        MAX(l.Battery) AS Battery,
                        MAX(l.Others) AS Others,
                        MAX(p.Name) AS tensanpham,
                        MAX(im.Name) AS Name,
                        MAX(im.linkImg) AS linkImg,
                        MAX(bpc.Amount) AS Amount
                    FROM 
                        cellphoneapp_branch b,
                        cellphoneapp_branch_product_color bpc,
                        cellphoneapp_product_color pc,
                        cellphoneapp_product p,
                        cellphoneapp_laptop l,
                        cellphoneapp_imageproduct im
                    WHERE 
                        b.Id = bpc.idBranch_id AND
                        bpc.idProductColor_id = pc.Id AND
                        pc.idProduct_id = p.Id AND
                        p.Id = l.product_ptr_id AND
                        p.Id = im.idProduct_id AND
                        b.id = @branchId AND
                        operatorSystem IS NOT NULL
                    GROUP BY 
                        p.Id,
                        bpc.idBranch_id,
                        pc.Id

                ", connection))
                {
                    command.Parameters.AddWithValue("@branchId", branchId);

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

            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
            foreach (var row in rows)
            {
                var d = new Dictionary<string, object>();
                d["id"] = row[2];
                d["name"] = row[12];
                d["nameManufacture"] = row[4]; // row[4] theo câu truy vấn thì nó là discount
                d["currentPrice"] = row[3];
                d["id_product_color"] = row[1];
                d["currentColor"] = row[5];
                d["currentImage"] = row[14];
                d["operatorSystem"] = row[6];
                d["CPU"] = row[7];
                d["RAM"] = row[8];
                d["ROM"] = row[9];
                d["Battery"] = row[10];
                d["Others"] = row[11];
                d["amount"] = row[15];
                data.Add(d);
            }
            List<Dictionary<string, object>> filteredData = data
            .GroupBy(d => d["id"])
            .Select(g => g.First())
            .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
            .ToList();

            string json2 = JsonConvert.SerializeObject(filteredData);
            return Ok(json2);
        }

        [HttpGet("home/comments/{id_product}")]
        public IActionResult GetCommentProduct(int id_product)
        {

            var comments = context.CellphoneappComments
                  .Where(c => c.IdProductId == id_product)
                  .Include(c => c.InverseIdReplyNavigation) // load các comment phản hồi
                      .ThenInclude(r => r.IdUser) // load thông tin IdUser của các comment phản hồi
                  .Select(c => new
                  {
                      Id = c.Id,
                      userName = c.IdUser.UserName,
                      contentComment = c.ContentComment,
                      idUser = c.IdUser.Id,
                      idProduct = c.IdProductId,
                      commentReply = c.InverseIdReplyNavigation
                          .Select(r => new
                          {
                              Id = r.Id,
                              userName = r.IdUser.UserName,
                              contentComment = r.ContentComment,
                              idUser = r.IdUser.Id,
                              idProduct = r.IdProductId,// lấy thông tin userName của các comment phản hồi
                          })
                  })
                  .ToList();


            string json2 = JsonConvert.SerializeObject(comments);
            return Ok(json2);


        }


        [HttpGet("home/order_lookup/{deliveryPhone}")]
        public IActionResult GetOrderLookUp(string deliveryPhone)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
             SELECT o.id AS order_ID, 
                      max( o.Status), 
                       SUM(od.unit_price * od.Quantity) AS toltal_Price, 
                       (
                         SELECT p.id AS id_product, 
                                p.Name as Name, 
                                od.unit_price as unitPrice, 
                                od.Quantity as quantity, 
                                pc.nameColor_id as nameColor, 
                                bpc.id AS id_branch_product_color 
                         FROM   cellphoneapp_orderdetail od 
                                INNER JOIN cellphoneapp_branch_product_color bpc 
                                        ON od.idBrandProductColor_id = bpc.id 
                                INNER JOIN cellphoneapp_product_color pc 
                                        ON bpc.idProductColor_id = pc.id 
                                INNER JOIN cellphoneapp_product p 
                                        ON pc.idProduct_id = p.id 
                         WHERE  od.idOder_id = o.id 
                         FOR json path
                       ) AS productDetail, 
                       Max(o.orderDate), 
                       Max(bpc.Id) 
                FROM   cellphoneapp_order o 
                       INNER JOIN cellphoneapp_orderdetail od 
                               ON o.id = od.idOder_id 
                       INNER JOIN cellphoneapp_branch_product_color bpc 
                               ON od.idBrandProductColor_id = bpc.id 
                WHERE  o.deliveryPhone = @deliveryPhone 
                       AND o.Status IN ( 1, 2 ) 
                GROUP  BY o.id
         
                ", connection))
                {
                    command.Parameters.AddWithValue("@deliveryPhone", deliveryPhone);

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

            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();

            foreach (object[] row in rows)
            {
                Dictionary<string, object> order = new Dictionary<string, object>();
                order["order_ID"] = row[0];
                order["Status"] = row[1];
                order["toltal_Price"] = row[2];
                order["orderDate"] = row[4];
                order["product_Detail"] = JsonConvert.DeserializeObject<List<object>>(row[3].ToString());
                order["id_branch_product_color"] = row[5];
                data.Add(order);
            }


            string json2 = JsonConvert.SerializeObject(data);
            return Ok(json2);

        }



        [HttpGet("home/branch/{branch_id}/search/{name_product}")]
        public IActionResult SearchName(int branch_id, string name_product)
        {
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
              SELECT  MAX(pc.Id) AS ProductColorId, pc.idProduct_id AS productID, MAX(pc.Price), MAX(pc.nameColor_id), MAX(bpp.discountRate), MAX(p.timeStart), MAX(p.timeEnd), MAX(bp.Amount), MAX(b.Name) AS branch_name, MAX(p2.Name) AS product_name, MAX(m.names )AS manufacturer_name,MAX(i.linkImg), MAX(r.Title) AS review_title, MAX(r.Content) AS review_content,  MAX(bpc.Amount) ,MAX(bp.Id)
                        FROM cellphoneapp_promotion p 
                        JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
                        JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
                        JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
                        JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
                        JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
                        JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
                        LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
                        LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
                        JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
                        WHERE b.Id = @branch_id  and  pc.nameColor_id like i.Name and p.Active = 1 and p2.Name like  '%' + @name_product + '%'
                        group by  pc.idProduct_id,pc.Id
                ", connection))
                {
                    command.Parameters.AddWithValue("@branch_id", branch_id);
                    command.Parameters.AddWithValue("@name_product", name_product);
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
            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();

            foreach (var row in rows)
            {
                Dictionary<string, object> d = new Dictionary<string, object>();
                d["branch_name"] = row[8];
                d["id"] = row[1];
                d["name"] = row[9];
                d["nameManufacture"] = row[10];
                // row[4] theo câu truy van thi no la discount
                d["currentPrice"] = Convert.ToDouble(row[2]) - Convert.ToDouble(row[2]) * Convert.ToDouble(row[4]);

                d["price"] = row[2];
                d["discountRate"] = row[4];
                d["id_product_color"] = row[0];
                d["currentColor"] = row[3];
                d["currentImage"] = row[11];
                d["reviewTitle"] = row[12];
                d["introduce"] = row[13];

                d["amount"] = row[14];
                d["id_branch_product_color"] = row[15];
                data.Add(d);
            }

            List<Dictionary<string, object>> filteredData = data
              .GroupBy(d => d["id"])
              .Select(g => g.First())
              .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
              .ToList();


            // lay tat ca hang
            List<object[]> rows2 = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
              select max(bpc.idBranch_id),max(pc.Id) as idProduct_color, MAX(p.Id) as product_id ,MAX(pc.Price),MAX(p.nameManufacture_id),MAX(pc.nameColor_id), MAX(p.Name) as tensanpham ,MAX(im.Name) ,MAX( im.linkImg), MAX(bpc.Amount),MAX(bpc.Id) from cellphoneapp_branch b,cellphoneapp_branch_product_color bpc ,cellphoneapp_product_color pc, cellphoneapp_product p,cellphoneapp_imageproduct im
                                where b.Id = bpc.idBranch_id and
                                bpc.idProductColor_id = pc.Id and
                                pc.idProduct_id = p.Id and
                                p.Id = im.idProduct_id and
                                b.id = @branch_id and p.Name like '%' + @name_product + '%' and  pc.nameColor_id like im.Name
                                group by p.id,pc.Id
                ", connection))
                {
                    command.Parameters.AddWithValue("@branch_id", branch_id);
                    command.Parameters.AddWithValue("@name_product", name_product);
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
                            rows2.Add(rowValues);
                        }
                    }
                }
            }

            List<Dictionary<string, object>> data2 = new List<Dictionary<string, object>>();
            foreach (var row in rows2)
            {
                Dictionary<string, object> d = new Dictionary<string, object>();
                d["id"] = row[2];
                d["name"] = row[6];
                d["nameManufacture"] = row[4];
                d["currentPrice"] = row[3];
                d["price"] = row[3];
                d["id_product_color"] = row[1];
                d["currentColor"] = row[5];
                d["currentImage"] = row[8];
                d["amount"] = row[9];
                d["id_branch_product_color"] = row[10];
                data2.Add(d);
            }

            List<Dictionary<string, object>> filteredData2 = data2
            .GroupBy(d => d["id"])
            .Select(g => g.First())
            .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
            .ToList();

            for (int i = 0; i < filteredData.Count; i++)
            {
                // Tìm phần tử trong data2 có cùng id_branch_product_color với row
                for (int j = 0; j < filteredData2.Count; j++)
                {
                    if (filteredData2[j]["id_branch_product_color"].Equals(filteredData[i]["id_branch_product_color"]))
                    {
                        // Thay thế giá trị của phần tử trong data2 bằng phần tử tương ứng trong data
                        filteredData2[j] = filteredData[i];
                        break;
                    }
                }
            }



            string json2 = JsonConvert.SerializeObject(filteredData2);
            return Ok(json2);
        }



        [HttpGet("home/branch/{branch_id}/search-price/{from_price}/{to_price}/{type_product}")]
        public IActionResult SearchPrice(int branch_id, double from_price, double to_price, int type_product)
        {
            string type = "";
            if (type_product == 1)
            {
                type = "phone";
            }
            else if (type_product == 2)
            {
                type = "laptop";
            }
            List<object[]> rows = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
              SELECT  MAX(pc.Id) AS ProductColorId, pc.idProduct_id AS productID, MAX(pc.Price), MAX(pc.nameColor_id), MAX(bpp.discountRate), MAX(p.timeStart), MAX(p.timeEnd), MAX(bp.Amount), MAX(b.Name) AS branch_name, MAX(p2.Name) AS product_name, MAX(m.names )AS manufacturer_name,MAX(i.linkImg), MAX(r.Title) AS review_title, MAX(r.Content) AS review_content,  MAX(bpc.Amount) ,MAX(bp.Id)
                        FROM cellphoneapp_promotion p 
                        JOIN cellphoneapp_branch_promotion_product bpp ON p.Id = bpp.idPromotion_id 
                        JOIN cellphoneapp_branch_product_color bp ON bpp.idBrandProductColor_id = bp.Id 
                        JOIN cellphoneapp_product_color pc ON bp.idProductColor_id = pc.Id 
                        JOIN cellphoneapp_branch b ON bp.idBranch_id = b.Id 
                        JOIN cellphoneapp_product p2 ON pc.idProduct_id = p2.Id 
                        JOIN cellphoneapp_manufacture m ON p2.nameManufacture_id = m.names 
                        LEFT JOIN cellphoneapp_imageproduct i ON p2.Id = i.idProduct_id 
                        LEFT JOIN cellphoneapp_review r ON p2.Id = r.idProduct_id 
                        JOIN cellphoneapp_branch_product_color bpc ON b.Id = bpc.idBranch_id AND pc.Id = bpc.idProductColor_id 
                        WHERE b.Id = @branch_id  and  pc.nameColor_id like i.Name and p.Active = 1 and (pc.Price - (pc.Price * bpp.discountRate))  BETWEEN @from_price AND  @to_price and p2.Type = @type
                        group by  pc.idProduct_id,pc.Id
                ", connection))
                {
                    command.Parameters.AddWithValue("@branch_id", branch_id);
                    command.Parameters.AddWithValue("@from_price", from_price);
                    command.Parameters.AddWithValue("@to_price", to_price);
                    command.Parameters.AddWithValue("@type", type);
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


            List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();

            foreach (var row in rows)
            {
                Dictionary<string, object> d = new Dictionary<string, object>();
                d["branch_name"] = row[8];
                d["id"] = row[1];
                d["name"] = row[9];
                d["nameManufacture"] = row[10];
                // row[4] theo câu truy van thi no la discount
                d["currentPrice"] = Convert.ToDouble(row[2]) - Convert.ToDouble(row[2]) * Convert.ToDouble(row[4]);

                d["price"] = row[2];
                d["discountRate"] = row[4];
                d["id_product_color"] = row[0];
                d["currentColor"] = row[3];
                d["currentImage"] = row[11];
                d["reviewTitle"] = row[12];
                d["introduce"] = row[13];

                d["amount"] = row[14];
                d["id_branch_product_color"] = row[15];
                data.Add(d);
            }

            List<Dictionary<string, object>> filteredData = data
              .GroupBy(d => d["id"])
              .Select(g => g.First())
              .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
              .ToList();


            // lay tat ca hang
            List<object[]> rows2 = new List<object[]>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(@"
                                select max(bpc.idBranch_id),max(pc.Id) as idProduct_color, MAX(p.Id) as product_id ,MAX(pc.Price),MAX(p.nameManufacture_id),MAX(pc.nameColor_id), MAX(p.Name) as tensanpham ,MAX(im.Name) ,MAX( im.linkImg), MAX(bpc.Amount),MAX(bpc.Id) from cellphoneapp_branch b,cellphoneapp_branch_product_color bpc ,cellphoneapp_product_color pc, cellphoneapp_product p,cellphoneapp_imageproduct im
                                where b.Id = bpc.idBranch_id and
                                bpc.idProductColor_id = pc.Id and
                                pc.idProduct_id = p.Id and
                                p.Id = im.idProduct_id and
                                 b.id = @branch_id and pc.Price between @from_price and @to_price and p.Type = @type
                                group by p.id,pc.Id
                ", connection))
                {
                    command.Parameters.AddWithValue("@branch_id", branch_id);
                    command.Parameters.AddWithValue("@from_price", from_price);
                    command.Parameters.AddWithValue("@to_price", to_price);
                    command.Parameters.AddWithValue("@type", type);
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
                            rows2.Add(rowValues);
                        }
                    }
                }
            }

            List<Dictionary<string, object>> data2 = new List<Dictionary<string, object>>();
            foreach (var row in rows2)
            {
                Dictionary<string, object> d = new Dictionary<string, object>();
                d["id"] = row[2];
                d["name"] = row[6];
                d["nameManufacture"] = row[4];
                d["currentPrice"] = row[3];
                d["price"] = row[3];
                d["id_product_color"] = row[1];
                d["currentColor"] = row[5];
                d["currentImage"] = row[8];
                d["amount"] = row[9];
                d["id_branch_product_color"] = row[10];
                data2.Add(d);
            }

            List<Dictionary<string, object>> filteredData2 = data2
            .GroupBy(d => d["id"])
            .Select(g => g.First())
            .OrderBy(d => d["id"]) // Sắp xếp theo thứ tự tăng dần của thuộc tính "id"
            .ToList();

            for (int i = 0; i < filteredData.Count; i++)
            {
                // Tìm phần tử trong data2 có cùng id_branch_product_color với row
                for (int j = 0; j < filteredData2.Count; j++)
                {
                    if (filteredData2[j]["id_branch_product_color"].Equals(filteredData[i]["id_branch_product_color"]))
                    {
                        // Thay thế giá trị của phần tử trong data2 bằng phần tử tương ứng trong data
                        filteredData2[j] = filteredData[i];
                        break;
                    }
                }
            }



            string json2 = JsonConvert.SerializeObject(filteredData2);
            return Ok(json2);
        }



        // xử lý thanh toán onl
        [HttpPost("home/checkout2")]
        public IActionResult CreatePaymentIntent([FromBody] RootObject data)
        {
            System.Diagnostics.Debug.WriteLine("nó có vào hàm thanh toán");

            decimal amount = data.amount;
            List<Alias.Product> products = data.products;
            Alias.Customer customer = data.customer;

            var productsPost = new List<object>();
            foreach (var item in products)
            {
                productsPost.Add(new
                {
                    name = item.name,
                    id_branch_product_color = item.id_branch_product_color,
                    currentPrice = item.currentPrice
                });
            }

            try
            {
                StripeConfiguration.ApiKey = "sk_test_51Mm6CAJTSCX72rEN0osGovCVaSKimGjDCkJjqJmA4vxPFvOav5pfxsJwuaNsm2GQOObTWTsiyY5zPog6FIrVBSgf00zDD66h8d";

                var options = new PaymentIntentCreateOptions
                {
                    Amount = (long?)amount, // Convert to cents
                    Currency = "vnd",
                    PaymentMethodTypes = new List<string> { "card" },
                    Metadata = new Dictionary<string, string>
            {
                { "customer_name", customer.name ?? "" },
                { "customer_phone", customer.deliveryPhone ?? "" },
                { "customer_address", customer.deliveryAddress ?? "" },
                { "products", JsonConvert.SerializeObject(productsPost) }
            },
                    PaymentMethodOptions = new PaymentIntentPaymentMethodOptionsOptions
                    {
                        Card = new PaymentIntentPaymentMethodOptionsCardOptions
                        {
                            RequestThreeDSecure = "automatic"
                        }
                    }
                };

                var service = new PaymentIntentService();
                var intent = service.Create(options);

                return new JsonResult(new { client_secret = intent.ClientSecret });
            }
            catch (StripeException e)
            {
                return new JsonResult(new { error = e.Message });
            }
        }


        // xử lý order
        [HttpPost("home/checkout-succeed")]
        public IActionResult Order([FromBody] OrderRequest data)
        {
            // Lưu thông tin khách hàng
            Dictionary<int, int> amountEachProduct = data.AmountEachProduct;
            List<Alias.Product> products = data.Products;
            Alias.Customer customer = data.Customer;
            DateTime orderDate = data.OrderDate;
            Console.WriteLine("Thông tin khách hàng là: " + customer);
            Console.WriteLine("Số lượng: " + amountEachProduct);
            Console.WriteLine("Ngày đặt hàng là: " + orderDate);

            // Kiểm tra và tạo đối tượng Role "customer" nếu chưa tồn tại
            var role = context.CellphoneappRoles.SingleOrDefault(r => r.NameRole == "customer");
            if (role == null)
            {
                role = new CellphoneappRole { NameRole = "customer" };
                context.CellphoneappRoles.Add(role);
                context.SaveChanges();
            }

            // Tạo đối tượng User với thông tin khách hàng và Role "customer"
            var user_order = new CellphoneappUser
            {
                Name = customer.name,
                Gender = 0,
                BirthDay = DateTime.MinValue,
                Email = string.Empty,
                UserName = string.Empty,
                PassWord = string.Empty,
                PhoneNumber = customer.deliveryPhone,
                Hometown = customer.deliveryAddress,
                IdRoleId = role.NameRole,
            };
            // Lưu đối tượng User vào CSDL
            context.CellphoneappUsers.Add(user_order);
            context.SaveChanges();

            var order_user = new CellphoneappOrder
            {
                OrderDate = orderDate,
                DeliveryAddress = customer.deliveryAddress,
                DeliveryPhone = customer.deliveryPhone,
                Status = "1",
                IdUser = user_order
            };
            context.CellphoneappOrders.Add(order_user);
            context.SaveChanges();

            // Console.WriteLine("Số lượng cửa hàng: " + products.Count);
            List<CellphoneappOrderdetail> List_Order_detail = new List<CellphoneappOrderdetail>();
            foreach (Alias.Product product in products)
            {
                int id_branch_product_color = product.id_branch_product_color;
                CellphoneappBranchProductColor branch_product_color = context.CellphoneappBranchProductColors.Find(id_branch_product_color);

                CellphoneappOrderdetail order_detail = new CellphoneappOrderdetail
                {
                    IdOder = order_user,
                    IdBrandProductColor = branch_product_color,
                    Quantity = amountEachProduct.GetValueOrDefault(id_branch_product_color),
                    UnitPrice = product.currentPrice
                };
                List_Order_detail.Add(order_detail);
            }
            // Console.WriteLine("Số lượng chi tiết đơn hàng: " + List_Order_detail.Count);

            // lay doc nhat
            HashSet<CellphoneappBranchProductColor> unique_ids = new HashSet<CellphoneappBranchProductColor>();
            List<CellphoneappOrderdetail> unique_items = new List<CellphoneappOrderdetail>();
            foreach (CellphoneappOrderdetail item in List_Order_detail)
            {
                if (!unique_ids.Contains(item.IdBrandProductColor))
                {
                    unique_ids.Add(item.IdBrandProductColor);
                    unique_items.Add(item);
                }
            }

            // Lặp qua các phần tử độc nhất
            foreach (CellphoneappOrderdetail item in unique_items)
            {
                Console.WriteLine(item);
            }
            context.CellphoneappOrderdetails.AddRange(unique_items);
            context.SaveChanges();

            Console.WriteLine("Thông tin sau khi lưu vào CSDL là: " + user_order);
            Console.WriteLine("Thông tin đơn hàng là: " + order_user);

            return Ok(new { message = "Order created successfully!" });
        }


        // xử lý login
        [HttpPost("home/login")]
        public IActionResult Login([FromBody] UserCredentials data)
        {

            string username = data.Username;
            string passwordUserInput = data.Password;

            try
            {
                var user = context.CellphoneappUsers.SingleOrDefault(u => u.UserName == username);

                if (user == null)
                {
                    // Trả về HTTP response với mã lỗi 404 Not Found nếu không tìm thấy user
                    return new JsonResult(new { status = "fail", message = "khong co user" });
                }

                if (UserRegister.HashPassword(passwordUserInput).Equals(user.PassWord))
                {
                    var userDict = new Dictionary<string, object>
                        {
                            { "id", user.Id },
                            { "name", user.Name },
                            { "email", user.Email },
                            { "gender", user.Gender },
                            { "hometown", user.Hometown },
                            { "username", user.UserName },
                            { "birthday", user.BirthDay },
                            { "phone_number", user.PhoneNumber },
                            { "role_id", user.IdRoleId },
                        };

                    var userJson = JsonConvert.SerializeObject(userDict);

                    return new JsonResult(new { status = "ok", user = userJson });
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine($"nó có vào hàm login {user.PassWord}");
                    return new JsonResult(new { status = "fail", message = "Invalid login" });
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                return new JsonResult(new { status = "error", message = ex.Message });
            }
        }



        [HttpPost("home/register")]
        public IActionResult SaveUser([FromBody] UserRegister userObject)
        {
            var user_dict = userObject;
            short gender_ = 0;
            if (user_dict.Gender == "female")
            {
                gender_ = 1;
            }
            else
            {
                gender_ = 0;
            }

            var role = context.CellphoneappRoles.FirstOrDefault(x => x.NameRole == "customer");

            if (context.CellphoneappUsers.Any(u => u.UserName == user_dict.Username))
            {
                return BadRequest(new { status = false, message = "Username hoặc số điện thoại hoặc email đã trùng, vui lòng thay đổi để hợp lệ" });
            }



            //if (context.CellphoneappUsers.Any(u => u.Email == user_dict.Email))
            //{
            //    return BadRequest(new { status = false, message = "Username hoặc số điện thoại hoặc email đã trùng, vui lòng thay đổi để hợp lệ" });
            //}

            var user = new CellphoneappUser()
            {
                Name = user_dict.Name,
                Email = user_dict.Email,
                Gender = gender_,
                Hometown = user_dict.Hometown,
                PassWord = UserRegister.HashPassword(user_dict.Password),
                UserName = user_dict.Username,
                PhoneNumber = user_dict.PhoneNumber,
                IdRole = role,
            };

            context.CellphoneappUsers.Add(user);
            context.SaveChanges();

            return Ok(user_dict);
        }

        [HttpPost("home/comment/{idUser}/{idProduct}")]
        public IActionResult Comment([FromBody] CommentPost comment)
        {
            
            System.Diagnostics.Debug.WriteLine("nó có vào hàm post comment" + comment);
            var cm = new CellphoneappComment()
            {
                ContentComment = comment.ContentComment,
                IdProductId = comment.IdProductId,
                IdUserId = comment.IdUserId,
                IdReply = comment.IdReply
            };

            context.CellphoneappComments.Add(cm);
            context.SaveChanges();

            return Ok(cm);
         
        }



        // xóa comment
        [HttpDelete("home/delete/comment/{id}")]
        public async Task<IActionResult> DeleteComment(int id)
        {
            var comment = await context.CellphoneappComments.FindAsync(id);
            if (comment == null)
            {
                return NotFound();
            }

            // Xóa tất cả các comment reply của comment này
            var replyComments = context.CellphoneappComments.Where(c => c.IdReply == comment.Id);
            context.CellphoneappComments.RemoveRange(replyComments);

            // Xóa comment này
            context.CellphoneappComments.Remove(comment);

            await context.SaveChangesAsync();

            return NoContent();
        }

    }
}
