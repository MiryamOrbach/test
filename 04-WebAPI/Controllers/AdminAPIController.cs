using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Seldat {
    [EnableCors("*", "*", "*")]
    public class AdminAPIController : ApiController {
        private AdminLogic adminLogic = new AdminLogic();
        [HttpPost]
        [Route("api/admin")]
        public HttpResponseMessage CheckLogin([FromBody]AdminModel admin) {
            try {
                bool login = adminLogic.CheckAdmin(admin);
                if (!ModelState.IsValid)
                    return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState.GetAllErrors());
                return Request.CreateResponse(HttpStatusCode.OK, login);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }
        protected override void Dispose(bool disposing) {
            if (disposing) {
                adminLogic.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}
