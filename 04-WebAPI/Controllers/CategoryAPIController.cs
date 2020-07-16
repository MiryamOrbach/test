using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Seldat {
    [EnableCors("*", "*", "*")]
    public class CategoryAPIController : ApiController {
        private CategoryLogic categoryLogic = new CategoryLogic();
        [HttpGet]
        [Route("api/categories")]
        public HttpResponseMessage GetCatgories() {
            try {
                List<CategoryModel> categories = categoryLogic.GetAllCategories();
                return Request.CreateResponse(HttpStatusCode.OK, categories);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpGet]
        [Route("api/categories/{id}")]
        public HttpResponseMessage Getclothes(int id) {
            try {
                List<ClothingModel> clothes = categoryLogic.GetClotesByCategory(id);
                return Request.CreateResponse(HttpStatusCode.OK, clothes);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        protected override void Dispose(bool disposing) {
            if (disposing) {
                categoryLogic.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
