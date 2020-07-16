using System.Collections.Generic;
using System.Linq;

namespace Seldat {
    public class TypeLogic : BaseLogic {
        public List<TypeModel> GetAllTypes() {
            return DB.Types.Select(t => new TypeModel {
                id = t.Id,
                name = t.Name
            }).ToList();
        }

        public List<TypeModel> GetTypesByCategory(int categoryId) {
            return DB.Categories.Where(c => c.Id == categoryId).FirstOrDefault().Types
                .Select(t => new TypeModel {
                    id = t.Id,
                    name = t.Name
                }).ToList();
        }
    }
}
