using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Administrator : User
    {

        public Administrator(int idNumber, string firstName, string surname, string email, string password, Department department) : base(idNumber, firstName, surname, email, password, department)
        {
            this.FirstName = firstName;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
            this.IdNumber = IdNumber;
            this.Department = department;
        }

        public void SetAcademicYearDates()
        {

        }

        public void AddStaff()
        {

        }

        public void RemoveStaff()
        {

        }
    }
}