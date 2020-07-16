using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Seldat {
    [EnableCors("*", "*", "*")]
    public class ClothAPIController : ApiController {
        private ClothingLogic clothingLogic = new ClothingLogic();
        [HttpGet]
        [Route("api/clothing")]
        public HttpResponseMessage Getclothes() {
            try {
                List<ClothingModel> clothes = clothingLogic.GetAllClothes();
                return Request.CreateResponse(HttpStatusCode.OK, clothes);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }
        [HttpGet]
        [Route("api/clothingbytype/{categoryId}/{typeId}")]
        public HttpResponseMessage GetclothesByCategoriesAndTypes(int categoryId, int typeId) {
            try {
                List<ClothingModel> clothes = clothingLogic.GetclothesByCategoriesAndTypes(categoryId, typeId);
                return Request.CreateResponse(HttpStatusCode.OK, clothes);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpGet]
        [Route("api/clothing/{id}")]
        public HttpResponseMessage GetCloth(int id) {
            try {
                ClothingModel cloth = clothingLogic.GetOneCloth(id);
                return Request.CreateResponse(HttpStatusCode.OK, cloth);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpPost]
        [Route("api/clothing")]
        public HttpResponseMessage AddCloth(ClothingModel cloth) {
            try {
                if (!ModelState.IsValid) {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState.GetAllErrors());
                }
                cloth = clothingLogic.AddCloth(cloth);
                return Request.CreateResponse(HttpStatusCode.Created, cloth);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpPost]
        [Route("api/upload")]
        public HttpResponseMessage UploadImage() {
            try {

                int clothingId = int.Parse(HttpContext.Current.Request.Form["clothingId"]);
                string originalName = HttpContext.Current.Request.Files[0].FileName;
                string newFileName = Guid.NewGuid().ToString() + Path.GetExtension(originalName);
                string fullPathAndFileName = HttpContext.Current.Server.MapPath("~/Images/" + newFileName);
                HttpContext.Current.Request.Files[0].SaveAs(fullPathAndFileName);
                ClothingModel cloth = clothingLogic.saveImage(clothingId, newFileName);
                return Request.CreateResponse(HttpStatusCode.Created, cloth);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        [HttpDelete]
        [Route("api/clothing/{id}")]
        public HttpResponseMessage DeleteCloth([FromUri]int id) {
            try {
                string path = HttpContext.Current.Server.MapPath("~/Images/" + clothingLogic.GetOneCloth(id).image);
                clothingLogic.DeleteCloth(id);
                File.Delete(path);
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }
            catch (Exception ex) {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        [HttpPut]
        [Route("api/cycleBasket")]
        public HttpResponseMessage InToCycleBasket(int id)
        {
            try
            {
                clothingLogic.InToCycleBasket(id);
                return Request.CreateResponse(HttpStatusCode.NoContent);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
            }
        }

        //[HttpGet]
        //[Route("api/cycleBasket")]
        //public HttpResponseMessage OutCycleBasket()
        //{
        //    try
        //    {
        //        List<ClothingModel> clothes = clothingLogic.OutCycleBasket();
        //        return Request.CreateResponse(HttpStatusCode.NoContent , clothes);
        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
        //    }
        //}

        //[HttpGet]
        //[Route("api/cycleBasket/{id}")]
        //public HttpResponseMessage OutCycleBasket([FromUri]int id)
        //{
        //    try
        //    { 
        //        return Request.CreateResponse(HttpStatusCode.NoContent,clothingLogic.OutCycleBasketById(id));
        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.GetUsreFriendlyMessage());
        //    }
        //}

        protected override void Dispose(bool disposing) {
            if (disposing) {
                clothingLogic.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

