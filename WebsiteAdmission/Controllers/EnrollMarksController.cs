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
    public class EnrollMarksController : BaseAdminController
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: EnrollMarks
        public ActionResult Index()
        {
            var enrollMarks = db.EnrollMarks.Include(e => e.Department);
            return View(enrollMarks.ToList());
        }

        // GET: EnrollMarks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollMark enrollMark = db.EnrollMarks.Find(id);
            if (enrollMark == null)
            {
                return HttpNotFound();
            }
            return View(enrollMark);
        }

        // GET: EnrollMarks/Create
        public ActionResult Create()
        {
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name");
            return View();
        }

        // POST: EnrollMarks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Year,Target,DepartmentId")] EnrollMark enrollMark)
        {
            if (ModelState.IsValid)
            {
                db.EnrollMarks.Add(enrollMark);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollMark.DepartmentId);
            return View(enrollMark);
        }

        // GET: EnrollMarks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollMark enrollMark = db.EnrollMarks.Find(id);
            if (enrollMark == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollMark.DepartmentId);
            return View(enrollMark);
        }

        // POST: EnrollMarks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Year,Target,DepartmentId")] EnrollMark enrollMark)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enrollMark).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartmentId = new SelectList(db.Departments, "Id", "Name", enrollMark.DepartmentId);
            return View(enrollMark);
        }

        // GET: EnrollMarks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnrollMark enrollMark = db.EnrollMarks.Find(id);
            if (enrollMark == null)
            {
                return HttpNotFound();
            }
            return View(enrollMark);
        }

        // POST: EnrollMarks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EnrollMark enrollMark = db.EnrollMarks.Find(id);
            db.EnrollMarks.Remove(enrollMark);
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
