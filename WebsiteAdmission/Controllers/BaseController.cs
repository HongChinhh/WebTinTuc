using System.Web.Mvc;

namespace WebsiteAdmission.Controllers
{
    public class BaseController : Controller
    {
        public void Alert(string type, string message)
        {
            TempData["message"] = message;
            switch (type)
            {
                case "success":
                    TempData["type"] = "success";
                    break;
                case "danger":
                    TempData["type"] = "danger";
                    break;
            }
        }
    }
}