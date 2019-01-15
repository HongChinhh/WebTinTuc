using System.Linq;
using System.Web.Mvc;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class SearchController : Controller
    {
        private readonly WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();
        public ActionResult Index(string query)
        {
            var posts = db.Posts.Include("User").ToList();
            if (string.IsNullOrEmpty(query))
                return View(posts);
            query = query.ToLower();
            posts = posts.Where(x => x.Title.ToLower().Contains(query) ||
                x.Body.ToLower().Contains(query) || x.User.FullName.ToLower().Contains(query)
                || x.User.UserName.ToLower().Contains(query))
                .ToList();
            ViewBag.query = query;
            return View(posts);
        }
    }
}