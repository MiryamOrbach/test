using System.Collections.Generic;
using System.Linq;

namespace Seldat {
    public class ClothingLogic : BaseLogic {
        public List<ClothingModel> GetAllClothes() {
            return DB.Clothes.Select(c => new ClothingModel {
                id = c.Id,
                category = new CategoryModel { id = c.Category.Id, name = c.Category.Name },
                company = new CompanyModel { id = c.Company.Id, name = c.Company.Name },
                type = new TypeModel { id = c.Type.Id, name = c.Type.Name },
                price = c.Price,
                discount = c.Discount,
                image = c.Image
            }).ToList();
        }
        public List<ClothingModel> GetclothesByCategoriesAndTypes(int categoryId, int typeId) {
            return DB.Clothes.Include("Categories").Include("Types").Include("Companies")
                .Where(c => c.CategoryId == categoryId && c.TypeId == typeId).Select(c => new ClothingModel {
                    id = c.Id,
                    category = new CategoryModel { id = c.Category.Id, name = c.Category.Name },
                    company = new CompanyModel { id = c.Company.Id, name = c.Company.Name },
                    type = new TypeModel { id = c.Type.Id, name = c.Type.Name },
                    price = c.Price,
                    discount = c.Discount,
                    image = c.Image
                }).ToList();
        }

        public ClothingModel GetOneCloth(int id) {
            return DB.Clothes.Where(c => c.Id == id).Select(c => new ClothingModel {
                id = c.Id,
                category = new CategoryModel { id = c.Category.Id, name = c.Category.Name },
                company = new CompanyModel { id = c.Company.Id, name = c.Company.Name },
                type = new TypeModel { id = c.Type.Id, name = c.Type.Name },
                price = c.Price,
                discount = c.Discount,
                image = c.Image
            }).FirstOrDefault();
        }

        public ClothingModel saveImage(int clothingId, string imageName) {
            DB.Clothes.FirstOrDefault(c => c.Id == clothingId).Image = imageName;
            DB.SaveChanges();
            return DB.Clothes.Include("Categories").Include("Types").Include("Companies")
                 .Where(c => c.Id == clothingId).Select(c => new ClothingModel {
                     id = c.Id,
                     category = new CategoryModel { id = c.Category.Id, name = c.Category.Name },
                     company = new CompanyModel { id = c.Company.Id, name = c.Company.Name },
                     type = new TypeModel { id = c.Type.Id, name = c.Type.Name },
                     price = c.Price,
                     discount = c.Discount,
                     image = c.Image
                 }).FirstOrDefault();
        }
        public ClothingModel AddCloth(ClothingModel model) {
            Clothing cloth = new Clothing {
                CategoryId = model.category.id,
                CompanyId = model.company.id,
                TypeId = model.type.id,
                Price = model.price,
                Discount = model.discount,
                Image = model.image
            };
            DB.Clothes.Add(cloth);
            DB.SaveChanges();
            model.id = cloth.Id;
            return model;
        }

        public void DeleteCloth(int id) {
            Clothing cloth = new Clothing { Id = id };
            DB.Clothes.Attach(cloth);
            DB.Clothes.Remove(cloth);
            DB.SaveChanges();

        }

        public void InToCycleBasket(int id)
        {
            Clothing cloth = DB.Clothes.Where(c => c.Id == id).FirstOrDefault();
            cloth.IsDeleted = true;
            DB.SaveChanges();
        }
    }
}
