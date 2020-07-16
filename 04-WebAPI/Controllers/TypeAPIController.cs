using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Seldat {
    [EnableCors("*", "*", "*")]
    public class TypeAPIController : ApiController {
        private TypeLogic typeLogic = new TypeLogic();
        [HttpGet]
        [Route("api/types")]
        public HttpResponseMessage GetTypes() {
            try {
                List<TypeModel> types = typeLogic.GetAllTypes();
                return Request.CreateResponse(HttpStatusCode.OK, types);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpGet]
        [Route("api/types/category/{id}")]
        public HttpResponseMessage GetTypesByCategory([FromUri] int id) {
            try {
                return Request.CreateResponse(HttpStatusCode.OK, typeLogic.GetTypesByCategory(id));
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }
        protected override void Dispose(bool disposing) {
            if (disposing) {
                typeLogic.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
