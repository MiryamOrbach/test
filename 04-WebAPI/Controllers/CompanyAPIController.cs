using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Seldat {

    [EnableCors("*", "*", "*")]
    public class CompanyAPIController : ApiController {
        private CompanyLogic companyLogic = new CompanyLogic();
        [HttpGet]
        [Route("api/companies")]
        public HttpResponseMessage GetCompanies() {
            try {
                List<CompanyModel> companies = companyLogic.GetAllCompanies();
                return Request.CreateResponse(HttpStatusCode.OK, companies);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }
        protected override void Dispose(bool disposing) {
            if (disposing) {
                companyLogic.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

