namespace WebsiteAdmission.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Post")]
    public partial class Post
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Post()
        {
            Feedbacks = new HashSet<Feedback>();
        }

        public int PostID { get; set; }

        [Required]
        [StringLength(250)]
        public string Title { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Body { get; set; }

        [StringLength(250)]
        public string CoverImage { get; set; }

        [StringLength(250)]
        public string Author { get; set; }

        public DateTime? CreatedTime { get; set; }

        public DateTime? PublishedTime { get; set; }

        public bool? Status { get; set; }

        public int User_UserID { get; set; }

        public int SubCategory_SubCategoryID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Feedback> Feedbacks { get; set; }

        public virtual SubCategory SubCategory { get; set; }

        public virtual User User { get; set; }
    }
}
