using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using WebsiteAdmission.Models;
using WebsiteAdmission.ViewModels;

namespace WebsiteAdmission.Controllers
{
    public class PageController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();
        // GET: Home
        public ActionResult Index(string id)
        {
            if (id == null)
            {
                id = db.SubCategories.FirstOrDefault()?.ParentCategory_ParentCatPath;
            }
            var subCategories = db.SubCategories
                .Where(s => s.ParentCategory_ParentCatPath == id)
                .OrderByDescending(s => s.Position)
                .ToList();
            return View("Index", subCategories);
        }

        public ActionResult Detail(int id)
        {
            ViewBag.ParentCategories = db.ParentCategories.OrderBy(s => s.Position).ToList();
            var post = db.Posts.Where(s => s.PostID == id).FirstOrDefault();
            return View("Detail", post);
        }

        public ActionResult FeedBack(int postID, string postTitle)
        {
            var feedBacks = db.Posts.Where(s => s.PostID == postID).First().Feedbacks;
            ViewBag.PostTitle = postTitle;
            return PartialView("_TuVan_ViewPhai", feedBacks);
        }
    }
}