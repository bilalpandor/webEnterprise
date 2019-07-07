using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class User
    {
        private string firstName;
        private string surname;
        private string email;
        private string password;
        private int idNumber;
        private Department department;
        private bool active;
        private DateTime lastLogin;
        private bool admin;
        private bool qaMan;
        private bool qaCoor;

        public User(int idNumber, string firstName, string surname, string email, string password, Boolean active, DateTime lastLogin)
        {
            this.IdNumber = idNumber;
            this.FirstName = firstName;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
            this.Active = active;
            this.LastLogin = lastLogin;
        }

        public User(int idNumber, string firstName, string surname, string email, string password, Boolean active, DateTime lastLogin, Department department)
        {
            this.IdNumber = idNumber;
            this.FirstName = firstName;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
            this.Active = active;
            this.LastLogin = lastLogin;
            this.Department = department;
        }

        public User(int idNumber, string firstName, string surname, string email, string password, Department department)
        {
            this.idNumber = idNumber;
            this.firstName = firstName;
            this.surname = surname;
            this.email = email;
            this.password = password;
            this.department = department;
        }

        public string FirstName
        {
            get
            {
                return firstName;
            }

            set
            {
                firstName = value;
            }
        }

        public string Surname
        {
            get
            {
                return surname;
            }

            set
            {
                surname = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public int IdNumber
        {
            get
            {
                return idNumber;
            }

            set
            {
                idNumber = value;
            }
        }

        public Department Department
        {
            get
            {
                return department;
            }

            set
            {
                department = value;
            }
        }

        public bool Active
        {
            get
            {
                return active;
            }

            set
            {
                active = value;
            }
        }

    
        public DateTime LastLogin
        {
            get
            {
                return lastLogin;
            }

            set
            {
                lastLogin = value;
            }
        }

        public bool Admin
        {
            get
            {
                return admin;
            }

            set
            {
                admin = value;
            }
        }

        public bool QaMan
        {
            get
            {
                return qaMan;
            }

            set
            {
                qaMan = value;
            }
        }

        public bool QaCoor
        {
            get
            {
                return qaCoor;
            }

            set
            {
                qaCoor = value;
            }
        }

        public void Login()
        {

        }

        public void Register()
        {

        }

        private void ResetPassword()
        {

        }

        private void AgreeToTermsAndConditions()
        {

        }
    }
}