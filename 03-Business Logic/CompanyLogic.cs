using System.Collections.Generic;
using System.Linq;

namespace Seldat {
    public class CompanyLogic : BaseLogic {
        public List<CompanyModel> GetAllCompanies() {
            return DB.Companies.Select(c => new CompanyModel {
                id = c.Id,
                name = c.Name
            }).ToList();
        }
    }
}
