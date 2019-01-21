using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class StatisticController : Controller
    {
        private readonly WebsiteAdmissionDbContext db;
        public StatisticController()
        {
            db = new WebsiteAdmissionDbContext();
        }
        public ActionResult Index()
        {
            var vm = db.Departments
                .Include(x => x.EnrollMarks)
                .Include(x => x.EnrollTargets)
                .ToList();
            return View(vm);
        }
    }
}