using System;
using System.Linq;
using System.Web.Mvc;
using WebsiteAdmission.Common;
using WebsiteAdmission.Models;
using WebsiteAdmission.ViewModels;

namespace WebsiteAdmission.Controllers
{
    public class AccountController : BaseController
    {
        private readonly WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel vm)
        {
            var password = PasswordHash.Encrypt(vm.Password);
            if (db.Users.Any(x => x.UserName == vm.Username && x.PassWord == password))
            {
                var user = db.Users.Single(x => x.UserName == vm.Username);
                Session["user_id"] = user.UserID;
                Session["role"] = user.Privilege_PrivilegeID;
                return RedirectToAction("Index", "Posts");
            }
            ViewBag.invalid = "Tài khoản không tồn tại";
            return View(vm);
        }

        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(RegisterViewModel vm)
        {
            if (ModelState.IsValid)
            {
                if (db.Users.Any(x => x.UserName == vm.Username))
                {
                    Alert("danger", "Tên đăng nhập đã tồn tại");
                    return View(vm);
                }
                if (db.Users.Any(x => x.Email == vm.Email))
                {
                    Alert("danger", "Email đã tồn tại");
                    return View(vm);
                }
                var password = PasswordHash.Encrypt(vm.Password);
                var user = new User
                {
                    UserName = vm.Username,
                    PassWord = password,
                    FullName = vm.Fullname,
                    Email = vm.Email,
                    Address = vm.Address,
                    Privilege_PrivilegeID = (int)Roles.User
                };
               
                try
                {
                    db.Users.Add(user);
                    db.SaveChanges();
                    Alert("success", "Đăng ký thành công");
                    return RedirectToAction("Login");
                }
                catch
                {
                    Alert("danger", "Đăng ký không thành công");
                    return View(vm);
                }

            }
            return View(vm);
        }

        public ActionResult Logout()
        {
            Session["user_id"] = null;
            Session["role"] = null;
            return RedirectToAction("Login");
        }
    }
}