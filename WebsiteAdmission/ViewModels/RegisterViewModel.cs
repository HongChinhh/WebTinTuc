using System.ComponentModel.DataAnnotations;

namespace WebsiteAdmission.ViewModels
{
    public class RegisterViewModel
    {
        [Display(Name = "Họ tên")]
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        [StringLength(50, ErrorMessage = "Họ tên chỉ được nhập tối đa {0} kí tự")]
        public string Fullname { get; set; }

        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Vui lòng điền tên đăng nhập")]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [MinLength(4, ErrorMessage = "Mật khẩu phải nhập tối thiểu {0} kí tự")]
        [StringLength(50, ErrorMessage = "Mật khẩu chỉ được nhập tối đa {0} kí tự")]
        public string Password { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Required(ErrorMessage = "Vui lòng xác nhận mật khẩu")]
        [StringLength(50, ErrorMessage = "Mật khẩu chỉ được nhập tối đa {0} kí tự")]
        [MinLength(4, ErrorMessage = "Mật khẩu phải nhập tối thiểu {0} kí tự")]
        [Compare("Password", ErrorMessage = "Mật khẩu vừa nhập không khớp")]
        public string PasswordConfirmation { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Vui lòng nhập email")]
        public string Email { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string  Address { get; set; }
    }
}