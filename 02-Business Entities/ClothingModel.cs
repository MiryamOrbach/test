using System.ComponentModel.DataAnnotations;

namespace Seldat {
    public class ClothingModel {
        public int id { get; set; }
        public CategoryModel category { get; set; }
        public TypeModel type { get; set; }
        public CompanyModel company { get; set; }
        [Required(ErrorMessage = "Missing Price")]
        [Range(0, int.MaxValue, ErrorMessage = "Price can't be negative and can't be too large")]
        public decimal price { get; set; }
        [Range(0, 100, ErrorMessage = "Discount can't be negative and can't be large than 100")]
        public float? discount { get; set; }
        public string image { get; set; }
        public bool isDeleted { get; set; }
        public int Likes { get; set; }
    }
}
