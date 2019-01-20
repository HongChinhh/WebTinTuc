using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebsiteAdmission.Models
{
    [Table("Departments")]
    public class Department
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<EnrollMark> EnrollMarks { get; set; }
        public virtual ICollection<EnrollTarget> EnrollTargets { get; set; }
    }
}