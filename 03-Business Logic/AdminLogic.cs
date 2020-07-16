using System.Linq;

namespace Seldat {
    public class AdminLogic : BaseLogic {
        public bool CheckAdmin(AdminModel admin) {
            admin.name = admin.name.Replace(";", " ");
            admin.password = admin.password.Replace(";", " ");
            return DB.Admins.Any(a => a.Name == admin.name && a.Password == admin.password);
        }
    }
}
