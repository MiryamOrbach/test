using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

using System.Text;
using System.Threading.Tasks;

namespace Seldat {
   public class ClothingContext:DbContext {
        public ClothingContext():base("Clothing")
        {
            Database.SetInitializer<ClothingContext>(new CreateDatabaseIfNotExists<ClothingContext>());
        }
        public DbSet<Clothing> Clothes { get; set; }
        public DbSet<Type> Types { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Admin> Admins { get; set; }

    }
}
