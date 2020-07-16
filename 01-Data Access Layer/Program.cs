using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Seldat {
    class Program {
        static void Main(string[] args) {
            using (ClothingContext context = new ClothingContext()) {
                Admin admin = new Admin {
                    Name = "miri",
                    Password="1234"
                };
                context.Admins.Add(admin);
                context.SaveChanges();
                Console.WriteLine("Done");
            }
        }
    }
}
