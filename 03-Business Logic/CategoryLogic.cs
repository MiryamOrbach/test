using System.Collections.Generic;
using System.Linq;

namespace Seldat {
    public class CategoryLogic : BaseLogic {

        public List<CategoryModel> GetAllCategories() {
            return DB.Categories.Select(c => new CategoryModel {
                id = c.Id,
                name = c.Name
            }).ToList();
        }

        public List<ClothingModel> GetClotesByCategory(int id) {
            return DB.Clothes.Include("Categories").Include("Types").Include("Companies")
                .Where(c => c.CategoryId == id).Select(c => new ClothingModel {
                    id = c.Id,
                    category = new CategoryModel { id = c.Category.Id, name = c.Category.Name },
                    company = new CompanyModel { id = c.Company.Id, name = c.Company.Name },
                    type = new TypeModel { id = c.Type.Id, name = c.Type.Name },
                    price = c.Price,
                    discount = c.Discount,
                    image = c.Image
                }).ToList();
        }
    }
}
