using System.ComponentModel.DataAnnotations;

namespace Seldat {
    public class AdminModel {
        public int id { get; set; }
        [RegularExpression("^.{2,10}$", ErrorMessage = "name must be 2-10 letters")]
        public string name { get; set; }
        [RegularExpression("^[0-9]{4}$", ErrorMessage = "password must be 4 numbers")]
        public string password { get; set; }
    }
}
