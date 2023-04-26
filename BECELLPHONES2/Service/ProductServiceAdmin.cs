using BECELLPHONES2.Alias;
using BECELLPHONES2.Entities;
using Stripe;

namespace BECELLPHONES2.Service
{
    public class ProductServiceAdmin
    {
        private readonly CellphonesContext context;
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



    }
}
