using System.ComponentModel.DataAnnotations.Schema;

namespace WebsiteAdmission.Models
{
    [Table("EnrollTargets")]
    public class EnrollTarget
    {
        public int Id { get; set; }
        public int Year { get; set; }
        public double Target { get; set; }
        public int DepartmentId { get; set; }
        public Department Department { get; set; }
    }
}