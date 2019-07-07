using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Department
    {
        private string departmentName;
        private int id;

        public Department(int id, string departmentName)
        {
            this.id = id;
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

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
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