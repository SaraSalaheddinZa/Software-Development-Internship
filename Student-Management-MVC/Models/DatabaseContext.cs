using System.Data.Entity;

namespace MVCProject.Models
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext() : base("name=DatabaseContext")
        {
        }
        public DbSet<StudentInfo> Students { get; set; }
        public DbSet<Country> Countries { get; set; }
    }
}
