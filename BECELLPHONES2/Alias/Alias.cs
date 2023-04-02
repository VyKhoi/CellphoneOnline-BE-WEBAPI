using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;

namespace BECELLPHONES2.Alias
{
    public class Alias
    {
        public int amount { get; set; }
    }
    public class Product
    {
        //public string branch_name { get; set; }
        public int id { get; set; }
        public string name { get; set; }
        public string nameManufacture { get; set; }
        public int id_branch_product_color { get; set; }
        public decimal currentPrice { get; set; }
    }

    public class Customer
    {
        public string name { get; set; }
        public string deliveryPhone { get; set; }
        public string deliveryAddress { get; set; }
    }

    public class RootObject
    {
        public decimal amount { get; set; }
        public List<Product> products { get; set; }
        public Customer customer { get; set; }
      
    }
    public class OrderRequest
    {
        [JsonProperty("amountEachProduct")]
        public Dictionary<int, int> AmountEachProduct { get; set; }
        public Customer Customer { get; set; }
        public DateTime OrderDate { get; set; }
        public List<Product> Products { get; set; }
    }
    // user login
    public class UserCredentials
    {
        public string Password { get; set; }
        public string Username { get; set; }
        public static bool VerifyPassword(string hashedPassword, string password)
        {
            var hashedBytes = Convert.FromBase64String(hashedPassword);
            using var sha256 = SHA256.Create();
            var passwordBytes = Encoding.UTF8.GetBytes(password);
            var computedHash = sha256.ComputeHash(passwordBytes);

            System.Diagnostics.Debug.WriteLine($"nó có vào hàm giải mã {computedHash}");
            return hashedBytes.SequenceEqual(computedHash);
        }



    }
    // user đăng ký
    public class UserRegister
    {
        public string ConfirmPassword { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string Hometown { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Username { get; set; }
        public static string HashPassword(string password)
        {
            using var sha256 = SHA256.Create();
            var bytes = Encoding.UTF8.GetBytes(password);
            var hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

    }


    public class CommentPost
    {
        
        public string ContentComment { get; set; } = null!;

        public int IdProductId { get; set; }

        public int IdUserId { get; set; }

        public int? IdReply { get; set; }
    }
    


}
