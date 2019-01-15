using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;
using WebsiteAdmission.Common;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class BaseAdminController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = Session["user_id"];            
            var role = Session["role"];            
            if (session == null || role == null)
            {
                filterContext.Controller.TempData.Add("message", "Vui lòng đăng nhập");
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "Account", action = "Login" }));
            }
            else
            {
                var userRole = int.Parse(role.ToString());
                if (userRole == (int)Roles.User)
                {
                    filterContext.Controller.TempData.Add("message", "Bạn không có quyền truy cập");
                    filterContext.Result = new RedirectToRouteResult(new
                         RouteValueDictionary(new { controller = "Account", action = "Login" }));
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}