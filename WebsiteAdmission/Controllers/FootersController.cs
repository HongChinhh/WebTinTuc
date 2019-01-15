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
    public class FootersController : BaseAdminController
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: Footers
        public ActionResult Index()
        {
            var footers = db.Footers.Include(f => f.Parent).Include(f => f.Post);
            return View(footers.ToList());
        }

        // GET: Footers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        // GET: Footers/Create
        public ActionResult Create()
        {
            ViewBag.ParentId = new SelectList(FootersWithNull(), "Id", "Name");
            ViewBag.PostId = new SelectList(PostsWithNull(), "PostID", "Title");
            return View();
        }

        // POST: Footers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,ParentId,PostId,Content,Status")] Footer footer)
        {
            if (ModelState.IsValid)
            {
                footer.ParentId = footer.ParentId == 0 ? null : footer.ParentId;
                footer.PostId = footer.PostId == 0 ? null : footer.PostId;
                db.Footers.Add(footer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentId = new SelectList(FootersWithNull(), "Id", "Name", footer.ParentId);
            ViewBag.PostId = new SelectList(PostsWithNull(), "PostID", "Title", footer.PostId);
            return View(footer);
        }

        // GET: Footers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(FootersWithNull(), "Id", "Name", footer.ParentId);
            ViewBag.PostId = new SelectList(PostsWithNull(), "PostID", "Title", footer.PostId);
            return View(footer);
        }

        // POST: Footers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,ParentId,PostId,Content,Status")] Footer footer)
        {
            if (ModelState.IsValid)
            {
                footer.ParentId = footer.ParentId == 0 ? null : footer.ParentId;
                footer.PostId = footer.PostId == 0 ? null : footer.PostId;
                db.Entry(footer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(FootersWithNull(), "Id", "Name", footer.ParentId);
            ViewBag.PostId = new SelectList(PostsWithNull(), "PostID", "Title", footer.PostId);
            return View(footer);
        }

        // GET: Footers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Footer footer = db.Footers.Find(id);
            if (footer == null)
            {
                return HttpNotFound();
            }
            return View(footer);
        }

        // POST: Footers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Footer footer = db.Footers.Find(id);
            db.Footers.Remove(footer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        private List<Post> PostsWithNull()
        {
            var posts = new List<Post>
            {
                new Post()
            };
            posts.AddRange(db.Posts);
            return posts;
        }

        private List<Footer> FootersWithNull()
        {
            var footers = new List<Footer>
            {
                new Footer()
            };
            footers.AddRange(db.Footers);
            return footers;
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
