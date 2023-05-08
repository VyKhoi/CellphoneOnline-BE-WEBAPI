using BECELLPHONES2.Alias;
using BECELLPHONES2.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;

namespace BECELLPHONES2.Service
{
    public class ProductServiceAdmin
    {
        private readonly CellphonesContext context;
        private readonly String connectionString = "Data Source=VYKHOI\\VYKHOI;Initial Catalog=cellphones;Integrated Security=True;TrustServerCertificate=True";

        public ProductServiceAdmin(CellphonesContext ctx)
        {
            context = ctx;
        }


        public int AddProductLaptop(CellphoneappProduct p, ProductAlias pa)
        {

            try
            {
                CellphoneappLaptop lt = new CellphoneappLaptop()
                {
                    ProductPtrId = p.Id,

                    Cpu = pa.Cpu,

                    Ram = pa.Ram,

                    Rom = pa.Rom,

                    GraphicCard = pa.GraphicCard,

                    Battery = pa.Battery,
                    OperatorSystem = pa.Os,

                    Others = pa.Others,


                };
                context.CellphoneappLaptops.Add(lt);
                context.SaveChanges();

                return 1;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public int AddProductPhone(CellphoneappProduct p, ProductAlias pa)
        {

            try
            {
                CellphoneappSmartphone lt = new CellphoneappSmartphone()
                {
                    ProductPtrId = p.Id,

                    Cpu = pa.Cpu,

                    Ram = pa.Ram,

                    Rom = pa.Rom,

                

                    Battery = pa.Battery,
                    OperatorSystem = pa.Os,

                    Others = pa.Others,


                };
                context.CellphoneappSmartphones.Add(lt);
                context.SaveChanges();

                return 1;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public int  DeleteProduct(int id)
        {
            try
            {


                var product = context.CellphoneappProducts.Find(id);
                if (product == null)
                {
                    return 2;
                }

                // lây các thông tin liên quan
                var imageProducts = context.CellphoneappImageproducts.Where(ip => ip.IdProductId == id);
                var reviews = context.CellphoneappReviews.Where(r => r.IdProductId == id);
                var comments = context.CellphoneappComments.Where(c => c.IdProductId == id);

                var smartphone = context.CellphoneappSmartphones.FirstOrDefault(sm => sm.ProductPtrId == id);
                if (smartphone != null)
                {
                    context.CellphoneappSmartphones.Remove(smartphone);
                }

                var laptop = context.CellphoneappLaptops.FirstOrDefault(l => l.ProductPtrId == id);
                if (laptop != null)
                {
                    context.CellphoneappLaptops.Remove(laptop);
                }
                List<CellphoneappProductColor> productColors = context.CellphoneappProductColors.Where(pcc => pcc.IdProductId == product.Id).ToList();
                List<CellphoneappBranchProductColor> branchProductColors = new List<CellphoneappBranchProductColor>();


                // lấy 1 mảng các cửa hàng- sản phâm
                for (int i = 0; i < productColors.Count; i++)
                {
                    branchProductColors.AddRange(context.CellphoneappBranchProductColors.Where(bpc => bpc.IdProductColorId == productColors[i].Id).ToList());

                    System.Diagnostics.Debug.WriteLine("id la  " + branchProductColors);
                    for (int j = 0; j < branchProductColors.Count; j++)
                    {
                        System.Diagnostics.Debug.WriteLine("id la  " + branchProductColors[j].Id);
                    }
                }

                // lấy khuyến mãi
                List<CellphoneappBranchPromotionProduct> branchPromotionProducts = new List<CellphoneappBranchPromotionProduct>();


                for (int i = 0; i < branchProductColors.Count; i++)
                {
                 List< CellphoneappBranchPromotionProduct>pr = context.CellphoneappBranchPromotionProducts.Where(pro => pro.IdBrandProductColorId == branchProductColors[i].Id).ToList();

                    if (pr != null)
                    {
                        branchPromotionProducts.AddRange(pr);
                    }
                }

                // xuất ra xem branchPromotionProducts
                for (int j = 0; j < branchPromotionProducts.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của khuyến mãi là  " + branchPromotionProducts[j].Id);
                }



                //lấy danh sách orderdetail 
                List<CellphoneappOrderdetail> orderdetails = new List<CellphoneappOrderdetail>();

                for (int i = 0; i < branchProductColors.Count; i++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của branchProductColors trong  orderdetails là  " + branchProductColors[i].Id);

                    List<CellphoneappOrderdetail> ord = context.CellphoneappOrderdetails.Where(o => o.IdBrandProductColorId == branchProductColors[i].Id).ToList();

                    if (ord != null)
                    {
                        orderdetails.AddRange(ord);
                    }

                }
                for (int j = 0; j < orderdetails.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của orderdetails là  " + orderdetails[j].Id);
                }




                // lấy phiếu order và mình sẽ thực hiện lọc không trùng
                List<CellphoneappOrder> orders = new List<CellphoneappOrder>();
                for (int i = 0; i < orderdetails.Count; i++)
                {
                    CellphoneappOrder o = context.CellphoneappOrders.FirstOrDefault(or => or.Id == orderdetails[i].IdOderId);
                    orders.Add(o);

                }


                // lấy không trùng ** đây là bản chính
                List<CellphoneappOrder> distinctOrders = orders.Select(o => o.Id).Distinct().Select(id => orders.First(o => o.Id == id)).ToList();

                // xuất danh sách orders ra xem thửu

                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của orders là  " + distinctOrders[j].Id);
                }
                // ta cần lấy tất cả orderDetail của order
                List<CellphoneappOrderdetail> AllOrrderDetailNeedToDelete = new List<CellphoneappOrderdetail>();
                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    AllOrrderDetailNeedToDelete.AddRange(context.CellphoneappOrderdetails.Where(dt => dt.IdOderId == distinctOrders[j].Id).ToList());
                }







                // thực hiện xóa
                context.CellphoneappImageproducts.RemoveRange(imageProducts);
                context.SaveChanges();
                context.CellphoneappReviews.RemoveRange(reviews);
                context.SaveChanges();
                context.CellphoneappComments.RemoveRange(comments);
                context.SaveChanges();


                // xóa khuyến mãi

                context.CellphoneappBranchPromotionProducts.RemoveRange(branchPromotionProducts);
                context.SaveChanges();


                // xóa orderdetail
                context.CellphoneappOrderdetails.RemoveRange(AllOrrderDetailNeedToDelete);
                context.SaveChanges();


                // xóa order
                context.CellphoneappOrders.RemoveRange(orders);
                context.SaveChanges();


                // xóa branch product color
                context.CellphoneappBranchProductColors.RemoveRange(branchProductColors);
                context.SaveChanges();


                // xóa product color 

                context.CellphoneappProductColors.RemoveRange(productColors);
                context.SaveChanges();



                context.CellphoneappProducts.Remove(product);
                context.SaveChanges();




                return 1;
            }catch (Exception ex)
            {
                return -1;
            }
        }

        public Dictionary<string, object> GetInforProduct(int id)
        {
            try
            {
                // get infor of product table
                CellphoneappProduct product = context.CellphoneappProducts.Find(id);
                if (product == null)
                {
                    return null;
                }

                // get image ("options sau này ")

                // get review 
                CellphoneappReview review = context.CellphoneappReviews.FirstOrDefault(p => p.IdProductId == product.Id);

                // get specifications bbelong to type
                CellphoneappSmartphone smartphone = null;
                CellphoneappLaptop laptop = null;
                if (product.Type == "phone")
                {
                    smartphone = context.CellphoneappSmartphones.Find(product.Id);
                }
                if (product.Type == "laptop")
                {
                    laptop = context.CellphoneappLaptops.Find(product.Id);
                }


                // đóng khung json
                var data = new Dictionary<string, object>();
                data["id"] = id;
                data["name"] = product.Name;
                data["manufacture"] = product.NameManufactureId;
                data["type"] = product.Type;
                data["images"] = new string[] { };

                data["title"] = review.Title;
                data["content"] = review.Content;

                // if the product is phone , we will get infor about that propertires
                if (product.Type == "phone")
                {
                    data["cpu"] = smartphone.Cpu;
                    data["ram"] = smartphone.Ram;
                    data["rom"] = smartphone.Rom;
                    data["battery"] = smartphone.Battery;
                    data["os"] = smartphone.OperatorSystem;
                    data["others"] = smartphone.Others;
                }


                if (product.Type == "laptop")
                {
                    data["cpu"] = laptop.Cpu;
                    data["ram"] = laptop.Ram;
                    data["rom"] = laptop.Rom;
                    data["battery"] = laptop.Battery;
                    data["os"] = laptop.OperatorSystem;
                    data["others"] = laptop.Others;
                }


                return data;

                //string json = JsonConvert.SerializeObject(data);
                //return Ok(json);
            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public int UpdateProduct( ProductAlias productAlias)
        {
            try
            {

                // get product table
                CellphoneappProduct product = context.CellphoneappProducts.Find(Convert.ToInt32(productAlias.Id));

                if (product != null)
                {
                    product.Name = productAlias.Name;
                    product.Type = productAlias.Type;
                    product.NameManufactureId = productAlias.Manufacture;
                    // Thực hiện lưu thay đổi vào cơ sở dữ liệu
                    context.SaveChanges();



                    // get review
                    CellphoneappReview review = context.CellphoneappReviews.FirstOrDefault(r => r.IdProductId == product.Id);
                    review.Title = productAlias.Title;
                    review.Content = productAlias.Content;
                    context.SaveChanges();

                    //sửa ảnh
                    //////////

                    // update infor specifications
                    if (product.Type == "phone")
                    {
                        CellphoneappSmartphone smartphone = context.CellphoneappSmartphones.FirstOrDefault(s => s.ProductPtrId == product.Id);
                        smartphone.Ram = productAlias.Ram;
                        smartphone.Rom = productAlias.Rom;
                        smartphone.Battery = productAlias.Battery;
                        smartphone.Others = productAlias.Others;
                        smartphone.Cpu = productAlias.Cpu;
                        smartphone.OperatorSystem = productAlias.Os;
                        context.SaveChanges();
                    }

                    if (product.Type == "laptop")
                    {
                        CellphoneappLaptop laptop = context.CellphoneappLaptops.FirstOrDefault(s => s.ProductPtrId == product.Id);
                        laptop.Ram = productAlias.Ram;
                        laptop.Rom = productAlias.Rom;
                        laptop.Battery = productAlias.Battery;
                        laptop.Others = productAlias.Others;
                        laptop.Cpu = productAlias.Cpu;
                        laptop.OperatorSystem = productAlias.Os;
                        laptop.GraphicCard = productAlias.GraphicCard;
                        context.SaveChanges();
                    }

                }
                return 1;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("nó có bi loi" + ex.Message);
                return -1;
            }

        }

        public CellphoneappProductColor GetProductColor(int idpc)
        {
            //id là id pc
            try
            {
                CellphoneappProductColor productColor = context.CellphoneappProductColors.Find(idpc);
                if (productColor == null)
                {
                    return null;
                }
                else
                {
                    return productColor;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }

        }



        public int DeleteProductColor(int idpc)
        {
            try
            {
                // get product-color in table 
                CellphoneappProductColor productColor = context.CellphoneappProductColors.Find(idpc);
                if (productColor == null)
                {
                    return 2;
                }

                //get lisst of branch have that product color
                List<CellphoneappBranchProductColor> branchProductColors = context.CellphoneappBranchProductColors.Where(bpc => bpc.IdProductColorId == productColor.Id).ToList();


                // get all promotion off this product
                List<CellphoneappBranchPromotionProduct> branchPromotionProducts = new List<CellphoneappBranchPromotionProduct>();
                for (int i = 0; i < branchProductColors.Count; i++)
                {
                    List<CellphoneappBranchPromotionProduct> pr = context.CellphoneappBranchPromotionProducts.Where(pro => pro.IdBrandProductColorId == branchProductColors[i].Id).ToList();

                    if (pr != null)
                    {
                        branchPromotionProducts.AddRange(pr);
                    }
                }
                // xuất ra xem branchPromotionProducts
                for (int j = 0; j < branchPromotionProducts.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của khuyến mãi là  " + branchPromotionProducts[j].Id);
                }


                //lấy danh sách orderdetail 
                List<CellphoneappOrderdetail> orderdetails = new List<CellphoneappOrderdetail>();

                for (int i = 0; i < branchProductColors.Count; i++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của branchProductColors trong  orderdetails là  " + branchProductColors[i].Id);

                    List<CellphoneappOrderdetail> ord = context.CellphoneappOrderdetails.Where(o => o.IdBrandProductColorId == branchProductColors[i].Id).ToList();

                    if (ord != null)
                    {
                        orderdetails.AddRange(ord);
                    }

                }
                for (int j = 0; j < orderdetails.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của orderdetails là  " + orderdetails[j].Id);
                }




                // lấy phiếu order và mình sẽ thực hiện lọc không trùng
                List<CellphoneappOrder> orders = new List<CellphoneappOrder>();
                for (int i = 0; i < orderdetails.Count; i++)
                {
                    CellphoneappOrder o = context.CellphoneappOrders.FirstOrDefault(or => or.Id == orderdetails[i].IdOderId);
                    orders.Add(o);

                }


                // lấy không trùng ** đây là bản chính
                List<CellphoneappOrder> distinctOrders = orders.Select(o => o.Id).Distinct().Select(id => orders.First(o => o.Id == id)).ToList();

                // xuất danh sách orders ra xem thửu

                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của orders là  " + distinctOrders[j].Id);
                }
                // ta cần lấy tất cả orderDetail của order
                List<CellphoneappOrderdetail> AllOrrderDetailNeedToDelete = new List<CellphoneappOrderdetail>();
                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    AllOrrderDetailNeedToDelete.AddRange(context.CellphoneappOrderdetails.Where(dt => dt.IdOderId == distinctOrders[j].Id).ToList());
                }



                /// action delete
                /// 
                context.CellphoneappBranchPromotionProducts.RemoveRange(branchPromotionProducts);
                context.SaveChanges();
                context.CellphoneappOrderdetails.RemoveRange(AllOrrderDetailNeedToDelete);
                context.SaveChanges();
                context.CellphoneappOrders.RemoveRange(orders);
                context.SaveChanges();
                context.CellphoneappBranchProductColors.RemoveRange(branchProductColors);
                context.SaveChanges();
                context.CellphoneappProductColors.Remove(productColor);
                context.SaveChanges();
                return 1;
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;
            }
        }


        public int AddProductColor([FromBody] ProductColorAlias productColorAlias)
        {

            try
            {
                //System.Diagnostics.Debug.WriteLine(string.Format("cac thong so{0} == {1}, do day mang {2}",productColorAlias.Price, productColorAlias.IdProduct_Id, productColorAlias.NameColor_Id));

                CellphoneappProductColor pc = new CellphoneappProductColor()
                {
                    Price = productColorAlias.Price,

                    IdProductId = productColorAlias.IdProduct_Id,

                    NameColorId = productColorAlias.NameColor_Id
                };

                context.CellphoneappProductColors.Add(pc);
                context.SaveChanges();
                return 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;
            }


        }


        public int UpdateProductColor([FromBody] ProductColorAlias productColorAlias)
        {

            try
            {
                CellphoneappProductColor pc = context.CellphoneappProductColors.Find(productColorAlias.Id);
                if (pc == null)
                {
                    return -1;
                }
                pc.Price = productColorAlias.Price;
                pc.IdProductId = productColorAlias.IdProduct_Id;
                pc.NameColorId = productColorAlias.NameColor_Id;

                context.SaveChanges();
                return 1;
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;
            }
        }


        public Dictionary<string, object> GetInforOfAProductColorInBranch(int idbppc)
        {
            try
            {
                // get branch product color in table
                CellphoneappBranchProductColor cellphoneappBranchProductColor = context.CellphoneappBranchProductColors.Find(idbppc);
                if (cellphoneappBranchProductColor == null)
                {
                    return null;
                }

                // get infor product color of that BPPC
                CellphoneappProductColor productColor = context.CellphoneappProductColors.FirstOrDefault(p => p.Id == cellphoneappBranchProductColor.IdProductColorId);
                // get infor prodyct of that PC
                CellphoneappProduct product = context.CellphoneappProducts.FirstOrDefault(p => p.Id == productColor.IdProductId);

                // create json of data
                var data = new Dictionary<string, object>();
                data["idBPPC"] = cellphoneappBranchProductColor.Id;
                data["nameProduct"] = product.Name;
                data["color"] = productColor.NameColorId;
                data["price"] = productColor.Price;
                data["amount"] = cellphoneappBranchProductColor.Amount;
                data["idPC"] = productColor.Id;
                data["idBranch"] = cellphoneappBranchProductColor.IdBranchId;


                return data;



            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }

        }



        public int AddInforOfAProductColorInBranch([FromBody] BranchProductColorAlias branchProductColorAlias)
        {
            try
            {
                CellphoneappBranchProductColor branchProductColor = new CellphoneappBranchProductColor()
                {
                    Amount = branchProductColorAlias.Amount,
                    IdBranchId = branchProductColorAlias.IdBranch,
                    IdProductColorId = branchProductColorAlias.IdPC
                };

                context.CellphoneappBranchProductColors.Add(branchProductColor);
                context.SaveChanges();
                return 1;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return -1;
            }
        }


        public int DeleteInforOfAProductColorInBranch(int idBPPC)
        {
            try
            {


                // get BPPC 
                CellphoneappBranchProductColor branchProductColor = context.CellphoneappBranchProductColors.Find(idBPPC);
                //System.Diagnostics.Debug.WriteLine(" Bppcccccccccccccccc la   " + branchProductColor.Id);
                if (branchProductColor == null)
                {
                    return 2; // not found
                }
                // get promotion
                List<CellphoneappBranchPromotionProduct> branchPromotionProducts = context.CellphoneappBranchPromotionProducts.Where(p => p.IdBrandProductColorId == branchProductColor.Id).ToList();


                //get order detail
                List<CellphoneappOrderdetail> orderdetails = context.CellphoneappOrderdetails.Where(p => p.IdBrandProductColorId == branchProductColor.Id).ToList();

                // lấy order
                List<CellphoneappOrder> orders = new List<CellphoneappOrder>();
                for (int i = 0; i < orderdetails.Count; i++)
                {
                    CellphoneappOrder o = context.CellphoneappOrders.FirstOrDefault(or => or.Id == orderdetails[i].IdOderId);
                    orders.Add(o);

                }
                // lấy không trùng ** đây là bản chính
                List<CellphoneappOrder> distinctOrders = orders.Select(o => o.Id).Distinct().Select(id => orders.First(o => o.Id == id)).ToList();
                // xuất danh sách orders ra xem thửu

                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    System.Diagnostics.Debug.WriteLine("id la của orders là  " + distinctOrders[j].Id);
                }
                // ta cần lấy tất cả orderDetail của order
                List<CellphoneappOrderdetail> AllOrrderDetailNeedToDelete = new List<CellphoneappOrderdetail>();
                for (int j = 0; j < distinctOrders.Count; j++)
                {
                    AllOrrderDetailNeedToDelete.AddRange(context.CellphoneappOrderdetails.Where(dt => dt.IdOderId == distinctOrders[j].Id).ToList());
                }

                // xóa
                context.CellphoneappBranchPromotionProducts.RemoveRange(branchPromotionProducts);
                context.SaveChanges();
                context.CellphoneappOrderdetails.RemoveRange(AllOrrderDetailNeedToDelete);
                context.SaveChanges();
                context.CellphoneappOrders.RemoveRange(orders);
                context.SaveChanges();
                context.CellphoneappBranchProductColors.Remove(branchProductColor);
                context.SaveChanges();
                return 1;
            }catch(Exception ex )
            { return -1; }

        }



        // hàm thống kê theo tháng của cac cứa hàng

        public List<Dictionary<string, object>> statisticalMonthOfBranch(int year, int month)
        {
            try
            {

                List<object[]> rows = new List<object[]>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(@"
                  SELECT b.Id as branchId,b.Name branchName, sum(od.Quantity * od.unit_price) as statiscal
                        FROM cellphoneapp_order o
                        INNER JOIN cellphoneapp_orderdetail od ON o.Id = od.idOder_id
                        INNER JOIN cellphoneapp_branch_product_color bpc ON od.idBrandProductColor_id = bpc.Id
                        Inner join cellphoneapp_branch b on bpc.idBranch_id = b.Id
                        WHERE DATEPART(YEAR, o.orderDate) = @year
                        AND DATEPART(MONTH, o.orderDate) = @month
                        group by b.Id,b.Name

                ", connection))
                    {
                        command.Parameters.AddWithValue("@year", year);
                        command.Parameters.AddWithValue("@month", month);

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
                    d["idBranch"] = row[0];
                    d["nameBranch"] = row[1];
                    d["statistical"] = row[2];
                    data.Add(d);
                }

                return data;

            }
            catch (Exception ex)
            {
                return null;
            }
        }



        // hàm thống kê 5 sp chạy nhất
        public List<Dictionary<string, object>> statisticalTop5OfBranch(int year, int month, int branchId)
        {
            try
            {

                List<object[]> rows = new List<object[]>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(@"
                SELECT top 5 p.Id as productId,p.Name as nameProduct, sum(od.Quantity) as totalAmountSale, sum(od.Quantity * od.unit_price) as totalRevenue
                    FROM cellphoneapp_order o
                    INNER JOIN cellphoneapp_orderdetail od ON o.Id = od.idOder_id
                    INNER JOIN cellphoneapp_branch_product_color bpc ON od.idBrandProductColor_id = bpc.Id
                    Inner join cellphoneapp_branch b on bpc.idBranch_id = b.Id
                    Inner join cellphoneapp_product_color pc on bpc.idProductColor_id = pc.Id
                    inner join cellphoneapp_product p on pc.idProduct_id = p.Id
                    WHERE DATEPART(YEAR, o.orderDate) = @year
                    AND DATEPART(MONTH, o.orderDate) = @month
                    and b.Id = @branchId
                    group by p.Id,p.Name 
                    order by totalAmountSale desc

                ", connection))
                    {
                        command.Parameters.AddWithValue("@year", year);
                        command.Parameters.AddWithValue("@month", month);
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


                // lúc nài row đang gio giá trị 
                List<Dictionary<string, object>> data = new List<Dictionary<string, object>>();
                foreach (var row in rows)
                {
                    var d = new Dictionary<string, object>();
                    d["productId"] = row[0];
                    d["nameProduct"] = row[1];
                    d["totalAmountSale"] = row[2];
                    d["totalRevenue"] = row[3];

                    data.Add(d);
                }


                return data;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}
