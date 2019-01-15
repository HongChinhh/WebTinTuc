using System.Web.Mvc;
using System.Web.Routing;
using WebsiteAdmission.Common;

namespace WebsiteAdmission.Filters
{
    public class IsSupermodAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = filterContext.HttpContext.Session["user_id"];
            var role = filterContext.HttpContext.Session["role"];
            if (session == null)
            {
                GoToLogin(filterContext);
            }
            var userRole = int.Parse(role.ToString());
            if (userRole == (int)Roles.User)
            {
                GoToLogin(filterContext);
            }
        }

        protected void GoToLogin(ActionExecutingContext filterContext)
        {
            filterContext.Controller.TempData["message"] = "Bạn không có quyền truy cập";
            filterContext.Result = new RedirectToRouteResult(new
                   RouteValueDictionary(new { controller = "Account", action = "Login" }));
        }
    }
}