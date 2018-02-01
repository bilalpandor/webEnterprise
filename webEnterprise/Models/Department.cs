using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Department
    {
        private string departmentName;

        public Department(string departmentName)
        {
            this.DepartmentName = departmentName;
        }

        public string DepartmentName
        {
            get
            {
                return departmentName;
            }

            set
            {
                departmentName = value;
            }
        }

        public void AddUserToDepartment(User user)
        {

        }

        public void RemoveUSerFromDepartment(User user)
        {

        }
    }
}