using BECELLPHONES2.Alias;
using BECELLPHONES2.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
namespace BECELLPHONES2.Service
{
    public class CustomerServiceAdmin
    {
        private readonly CellphonesContext context;
        public CustomerServiceAdmin(CellphonesContext ctx)
        {
            context = ctx;
        }
    }
}
