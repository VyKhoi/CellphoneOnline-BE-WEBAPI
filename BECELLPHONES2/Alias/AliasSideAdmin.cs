
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;

namespace BECELLPHONES2.Alias
{
    public class AliasSideAdmin
    {
    }

    public class Image
    {
        public string NameImage { get; set; }
        public string Images { get; set; }
    }

    public class ProductAlias
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Manufacture { get; set; }
        public string Type { get; set; }
        public List<Image> Images { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Cpu { get; set; }
        public string Ram { get; set; }
        public string Rom { get; set; }
        public string GraphicCard { get; set; }
        public string Battery { get; set; }
        public string Os { get; set; }
        public string Others { get; set; }
    }
    public class ProductColorAlias
    {
        public int Id { get; set; }
        public decimal Price { get; set; }
        public int IdProduct_Id { get; set; }
        public string NameColor_Id { get; set; }
    }


    public class BranchProductColorAlias
    {
        public int IdBPPC { get; set; }
        public int IdPC { get; set; }
             public int IdBranch { get; set; }
        public int Amount { get; set; }
    }

}
