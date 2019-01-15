using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;
using WebsiteAdmission.Common;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Filters
{
    public class IsModAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = filterContext.HttpContext.Session["user_id"];
            var role = filterContext.HttpContext.Session["role"];
            if (session == null || role == null)
            {
                GoToLogin(filterContext);
            }
            var user_role = int.Parse(role.ToString());
            if (user_role != (int)Roles.Admin || user_role != (int)Roles.Mod)
            {
                GoToLogin(filterContext);
            }
        }

        protected void GoToLogin(ActionExecutingContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(new
                   RouteValueDictionary(new { controller = "Account", action = "Login" }));
        }
    }
}