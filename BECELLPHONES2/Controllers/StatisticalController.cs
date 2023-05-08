using BECELLPHONES2.Alias;
using BECELLPHONES2.Entities;
using BECELLPHONES2.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;

namespace BECELLPHONES2.Controllers
{
    public class StatisticalController : ControllerBase
    {
        private readonly CellphonesContext context;
        private readonly String connectionString = "Data Source=VYKHOI\\VYKHOI;Initial Catalog=cellphones;Integrated Security=True;TrustServerCertificate=True";

        public StatisticalController(CellphonesContext ctx)
        {
            context = ctx;
        }


        //API statistical belong to month of branches
        [HttpGet("Admin/statisticalBranchsOfMonth/{year}/{month}")]
        public IActionResult statisticalMonthOfBranch(int year, int month)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                List<Dictionary<string, object>> data = sv.statisticalMonthOfBranch(year, month);

                if (data == null)
                {
                    throw new Exception("bi lỗi null");
                }
                string json2 = JsonConvert.SerializeObject(data);
                return Ok(json2);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        //API statistical 5  best selling products in branch
        [HttpGet("Admin/statisticalTop5/{year}/{month}/{branchId}")]
        public IActionResult statisticalTop5OfBranch(int year, int month, int branchId)
        {
            try
            {
                ProductServiceAdmin sv = new ProductServiceAdmin(context);
                List<Dictionary<string, object>> data = sv.statisticalTop5OfBranch(year, month,branchId);

                if (data == null)
                {
                    throw new Exception("bi lỗi null");
                }
                string json2 = JsonConvert.SerializeObject(data);
                return Ok(json2);

            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}
