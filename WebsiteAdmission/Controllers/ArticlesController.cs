using System.Linq;
using System.Web.Mvc;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class ArticlesController : Controller
    {
        private readonly WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();
        public ActionResult Detail(int? id)
        {
            var post = db.Posts.FirstOrDefault(x => x.PostID == id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }
    }
}