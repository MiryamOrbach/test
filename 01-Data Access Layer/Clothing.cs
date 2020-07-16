using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Seldat {
   public class Clothing {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        [ForeignKey("Type")]
        public int TypeId { get; set; }
        [ForeignKey("Company")]
        public int CompanyId { get; set; }
        [Required]
        public decimal Price { get; set; }
        public float? Discount { get; set; }
        public string Image { get; set; }
        public bool IsDeleted { get; set; }
        public int Likes { get; set; }
        public virtual Category Category { get; set; }
        public virtual Type Type { get; set; }
        public virtual Company Company { get; set; }
    }
}
