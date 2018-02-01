using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using webEnterprise.Models;

namespace webEnterprise
{
    public class DBconnectivity
    {
        private static OleDbConnection GetConnection()
        {
            string connString;
            //  change to your connection string in the following line
            connString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Bilal\Desktop\IdeaSystem\webEnterprise\webEnterprise\App_Data\IdeasCentreDB.accdb";
            return new OleDbConnection(connString);
        }

        public static User Login(string email, string password)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [User] WHERE [Email]='" + email + "' AND [Password]='" + password + "'");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);

            User thisUser = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();
                System.Diagnostics.Debug.Write("LOGGED INGJKGKJGKJGKJGKGHUKKGKFUKG ");



                while (reader.Read())
                {
                    thisUser = new User(reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString());
                }

            }
            catch (Exception ex)
            {
                string exception = ("NOT LOGGED IN - AN ERROR OCCURRED, " + ex);
                System.Diagnostics.Debug.Write(exception);
                return null;
            }
            finally
            {
                myConnection.Close();
            }

            return thisUser;

        }

    }
}