using System.ComponentModel.DataAnnotations;

namespace WebsiteAdmission.ViewModels
{
    public class LoginViewModel
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Vui lòng điền tên đăng nhập")]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [MinLength(4, ErrorMessage = "Mật khẩu phải nhập tối thiểu {0} kí tự")]
        [StringLength(50, ErrorMessage = "Mật khẩu chỉ được nhập tối đa {0} kí tự")]
        public string Password { get; set; }
    }
}