using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Category
    {
        private string categoryName;

        public Category(string categoryName)
        {
            this.CategoryName = categoryName;
        }

        public string CategoryName
        {
            get
            {
                return categoryName;
            }

            set
            {
                categoryName = value;
            }
        }

        public void AddCategory()
        {

        }

        public void DeleteCategory()
        {

        }
    }
}