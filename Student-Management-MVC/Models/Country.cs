using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCProject.Models
{
    public class Country
    {
        [Key]
        public int CountryId { get; set; }
        //Ensures "CountryName" is required and cannot be null
        [Required]
        [StringLength(100)]
        public string CountryName { get; set; }
        // Defines a one-to-many relationship between Country and Students
        // "ICollection" means a country can have a collection of students
        public virtual ICollection<StudentInfo> Students { get; set; }
    }
}