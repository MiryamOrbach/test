using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http.ModelBinding;

namespace Seldat {
    public static class ErrorsHelper {
        public static string GetMostInnerMessage(this Exception ex) {
            if (ex.InnerException == null)
                return ex.Message;
            return GetMostInnerMessage(ex.InnerException);
        }

        public static string GetUsreFriendlyMessage(this Exception ex) {
            string msg = ex.GetMostInnerMessage();
            if (msg.Contains("The DELETE statement conflicted with the REFERENCE constraint"))
                return "You can't delete an item which conected to other items";
            return "there was a problem,please try again";
        }

        public static string GetOneError(this ModelStateDictionary modelState) {
            return modelState.Where(ms => ms.Value.Errors.Any())
                       .Select(ms => ms.Value.Errors[0].ErrorMessage).FirstOrDefault();
        }

        public static Dictionary<string, List<string>> GetAllErrors(this ModelStateDictionary modelState) {
            Dictionary<string, List<string>> allErrors = new Dictionary<string, List<string>>();
            foreach (var prop in modelState.Where(ms => ms.Value.Errors.Any())) {
                List<string> errorMassege = new List<string>();
                foreach (var err in prop.Value.Errors) {
                    errorMassege.Add(err.ErrorMessage);
                }
                allErrors.Add(prop.Key.Substring(prop.Key.IndexOf('.') + 1), errorMassege);
            }
            return allErrors;
        }
    }
}