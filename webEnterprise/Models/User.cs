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
        private string idNumber;
        private Department department;

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

        public string IdNumber
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

        public User(string firstName, string surname, string email, string password)
        {
            this.FirstName = firstName;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
        }

        public User(string firstName, string surname, string email, string password, string idNumber, Department department)
        {
            this.FirstName = firstName;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
            this.IdNumber = idNumber;
            this.Department = department;
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