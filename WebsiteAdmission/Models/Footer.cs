using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;

namespace WebsiteAdmission.Models
{
    [Table("Footers")]
    public class Footer
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public int? ParentId { get; set; }

        public int? PostId { get; set; }

        [AllowHtml]
        public string Content { get; set; }

        public bool Status { get; set; }

        public Footer Parent { get; set; }

        public Post Post { get; set; }
    }
}