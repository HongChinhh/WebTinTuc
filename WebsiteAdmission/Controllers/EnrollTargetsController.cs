using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class EnrollTargetsController : BaseAdminController
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: EnrollTargets
        public ActionResult Index()
        {
            var enrollTargets = db.EnrollTargets.Include(e => e.Department);
            return View(enrollTargets.ToList());
        }

        // GET: EnrollTargets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollTarget enrollTarget = db.EnrollTargets.Find(id);
            if (enrollTarget == null)
            {
                return HttpNotFound();
            }
            return View(enrollTarget);
        }

        // GET: EnrollTargets/Create
        public ActionResult Create()
        {
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name");
            return View();
        }

        // POST: EnrollTargets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Year,Target,DepartmentId")] EnrollTarget enrollTarget)
        {
            if (ModelState.IsValid)
            {
                db.EnrollTargets.Add(enrollTarget);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollTarget.DepartmentId);
            return View(enrollTarget);
        }

        // GET: EnrollTargets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollTarget enrollTarget = db.EnrollTargets.Find(id);
            if (enrollTarget == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollTarget.DepartmentId);
            return View(enrollTarget);
        }

        // POST: EnrollTargets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Year,Target,DepartmentId")] EnrollTarget enrollTarget)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enrollTarget).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollTarget.DepartmentId);
            return View(enrollTarget);
        }

        // GET: EnrollTargets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollTarget enrollTarget = db.EnrollTargets.Find(id);
            if (enrollTarget == null)
            {
                return HttpNotFound();
            }
            return View(enrollTarget);
        }

        // POST: EnrollTargets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EnrollTarget enrollTarget = db.EnrollTargets.Find(id);
            db.EnrollTargets.Remove(enrollTarget);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
