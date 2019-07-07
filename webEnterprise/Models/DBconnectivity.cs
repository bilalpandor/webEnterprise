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
        public static OleDbConnection GetConnection()
        {
            string connString;
            //  change to your connection string in the following line 
            connString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\aaron\downloader\Final System (needs CSV and Analytics)\IdeaSystem\webEnterprise\webEnterprise\App_Data\IdeasCentreDB.accdb";
            return new OleDbConnection(connString);
        }

        public static bool checkAdmin(int department)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [QACoordinator] WHERE [DepartmentID]=" + department + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    if (reader.HasRows == true)
                    {
                        reader.Read();
                        return successBool = true;

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static bool SetQACoor(int user, int department)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE[QACoordinator] set UserID = " + user + " WHERE DepartmentID = " + department + "";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static List<User> getQACoors()
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT u.*, d.* FROM [User] u, [Department] d, [QACoordinator] qa WHERE u.UserID = qa.UserID AND qa.DepartmentID = d.DepartmentID");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            List<User> QAs = new List<User>();
            User thisUser = null;
            Department thisDepartment = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisDepartment = new Department((int)reader["DepartmentID"], reader["DName"].ToString());
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]), thisDepartment);
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
                    QAs.Add(thisUser);
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

            return QAs;
        }

        public static User getQACoorForDept(int deptID)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT u.*, d.* FROM [User] u, [Department] d, [QACoordinator] qa WHERE u.UserID = qa.UserID AND qa.DepartmentID = " + deptID + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            User thisUser = null;
            Department thisDepartment = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisDepartment = new Department((int)reader["DepartmentID"], reader["DName"].ToString());
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]), thisDepartment);
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
                    return thisUser;                  
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

        public static List<User> getUserByDept(int deptID)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT u.*, d.* FROM [User] u, [Department] d, [UserDepartment] ud WHERE u.UserID = ud.UserID AND ud.DepartmentID = d.DepartmentID AND d.DepartmentID = " + deptID + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            List<User> users = new List<User>();
            User thisUser = null;
            Department thisDepartment = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisDepartment = new Department((int)reader["DepartmentID"], reader["DName"].ToString());
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]), thisDepartment);
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
                    users.Add(thisUser);
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

            return users;
        }

        public static User LoginWithDept(string email, string password)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT u.*, d.* FROM [User] u, [Department] d, [UserDepartment] ud WHERE u.Email='" + email + "' AND u.Password='" + password + "' AND u.UserID = ud.UserID AND ud.DepartmentID = d.DepartmentID");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);

            User thisUser = null;
            Department thisDepartment = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisDepartment = new Department((int)reader["DepartmentID"], reader["DName"].ToString());
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]), thisDepartment);
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
                    bool admin = isUserAdmin(thisUser);
                    bool QaMan = isUserQAManager(thisUser);
                    bool QaCoor = isUserQACoor(thisUser);
                    thisUser.Admin = admin;
                    thisUser.QaMan = QaMan;
                    thisUser.QaCoor = QaCoor;
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

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]));
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
                    bool admin = isUserAdmin(thisUser);
                    bool QaMan = isUserQAManager(thisUser);
                    bool QaCoor = isUserQACoor(thisUser);
                    thisUser.Admin = admin;
                    thisUser.QaMan = QaMan;
                    thisUser.QaCoor = QaCoor;
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

        public static bool isUserAdmin(User thisUser)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [Administrator] WHERE [UserID]=" + thisUser.IdNumber + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = false;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    if (reader.HasRows == true)
                    {
                        reader.Read();
                        return successBool = true;

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static bool isUserQAManager(User thisUser)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [QualityAssuranceManager] WHERE [UserID]=" + thisUser.IdNumber + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = false;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    if (reader.HasRows == true)
                    {
                        reader.Read();
                        return successBool = true;

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static bool isUserQACoor(User thisUser)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [QACoordinator] WHERE [UserID]=" + thisUser.IdNumber + "");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = false;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    if (reader.HasRows == true)
                    {
                        reader.Read();
                        return successBool = true;

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static User getUserByEmail(string email)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [User] WHERE [Email]='" + email + "'");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);

            User thisUser = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    System.Diagnostics.Debug.Write("Getting to the while reader clause");
                    thisUser = new User((int)reader["UserID"], reader["Fname"].ToString(), reader["Sname"].ToString(), reader["Email"].ToString(), reader["Password"].ToString(), ((reader["Active"] as bool? ?? false)), Convert.ToDateTime(reader["LastLogin"]));
                    System.Diagnostics.Debug.Write(thisUser + " Is Logged In");
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

        public static Boolean updateLastLogin(DateTime time, User thisUser)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE[User] set LastLogin = '" + time + "' WHERE UserID = " + thisUser.IdNumber + "";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;

        }

        public static Boolean Register(string email, string password, string fName, string sName, Department department)
        {
            DateTime t1 = DateTime.Parse("2012/12/12 15:00:00.000");

            OleDbConnection myConnection = GetConnection();
            string myQuery = "INSERT INTO [User] ([Fname],[Sname], [Email], [Password], [LastLogin]) VALUES ( '" + fName + "', '" + sName + "', '" + email + "', '" + password + "', '" + t1 + "')";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            User user = Login(email, password);
            AddUserToDept(user, department);

            return successBool;
        }

        public static Boolean AddUserToDept(User thisUser, Department dept)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "INSERT INTO [UserDepartment] ([UserID],[DepartmentID]) VALUES ( '" + thisUser.IdNumber + "', '" + dept.Id + "')";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }
       
            return successBool;
        }

        internal static Boolean flagIdea(Idea thisIdea)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE [Idea] SET [Flagged] = TRUE WHERE IdeaID= " + thisIdea.IdeaID + "";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        internal static Idea GetIdeaByID(int ideaID)
        {

            Idea thisIdea = null;
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT distinct i.IdeaID, i.IdeaTitle, i.IdeaText, i.TimeOfPost, i.ClosureDate, i.Anonymous, u.UserID, u.Fname, u.Sname, u.Email, u.Password, c.CategoryID, c.CategoryName," +
                                "d.DepartmentID, d.DName FROM [Idea] i, [User] u, [Category] c, [Department] d, [UserDepartment] ud WHERE i.IdeaID =" + ideaID + " AND i.UserID = u.UserID AND i.CategoryID=c.CategoryID" + 
                                " AND ud.UserID = u.UserID AND ud.DepartmentID = d.DepartmentID");

            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();
                System.Diagnostics.Debug.Write("Fetching Ideas ");
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        int idea_id = (int)reader["IdeaID"];
                        string ideaTitle = reader["IdeaTitle"].ToString();
                        string ideaText = reader["IdeaText"].ToString();
                        DateTime timeOfPost = Convert.ToDateTime(reader["TimeOfPost"]);
                        DateTime closureDate = Convert.ToDateTime(reader["ClosureDate"]);
                        Boolean anonymous = (reader["Anonymous"] as int? == 1) ? true : false;

                        int user_id = (int)reader["UserID"];
                        string firstName = reader["Fname"].ToString();
                        string lastName = reader["Sname"].ToString();
                        string email = reader["Email"].ToString();
                        string password = reader["Password"].ToString();

                        int category_id = (int)reader["CategoryID"];
                        string categoryName = reader["CategoryName"].ToString();

                        int department_id = (int)reader["DepartmentID"];
                        string deptName = reader["DName"].ToString();

                        Department thisDept = new Department(department_id, deptName);
                        User thisUser = new User(user_id, firstName, lastName, email, password, thisDept);

                        Category thisCategory = new Category(category_id, categoryName);
                        thisIdea = new Idea(idea_id, ideaTitle, ideaText, timeOfPost, thisCategory, closureDate, thisUser, anonymous);
                        System.Diagnostics.Debug.Write("IDEA THAT HAS BEEN LOADED IS :" + thisIdea.IdeaTitle);
                    }
                }
            }
            catch (Exception ex)
            {
                string exception = ("FAILED TO LOAD IDEAS - AN ERROR OCCURRED, " + ex);
                System.Diagnostics.Debug.Write(exception);
            }
            finally
            {
                myConnection.Close();
            }
            return thisIdea;
        }

        public static List<Idea> GetIdeas()
        {
            List<Idea> ideaList = new List<Idea>();
            Idea thisIdea;
            OleDbConnection myConnection = GetConnection();
            //string myQuery = ("SELECT i.IdeaID, i.IdeaTitle, i.IdeaText, i.TimeOfPost, i.ClosureDate, i.Anonymous, u.UserID, u.Fname, u.Sname, u.Email, u.Password,  c.CategoryID, c.CategoryName, d.DepartmentID, d.DName FROM (User u), (Idea i), (Category c), (Department d), (UserDepartment ud) WHERE u.UserID = i.UserID AND i.CategoryID = c.CategoryID AND u.UserID = ud.UserId AND ud.DepartmentID = d.DepartmentID");
            string myQuery = ("SELECT i.IdeaID, i.IdeaTitle, i.IdeaText, i.TimeOfPost, i.ClosureDate, i.Anonymous, u.UserID, u.Fname, u.Sname, u.Email, u.Password FROM (Idea i INNER JOIN User u on i.UserID = u.UserID)");

            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();
                System.Diagnostics.Debug.Write("Fetching Ideas ");

                while (reader.Read())
                {
                    int idea_id = (int)reader["IdeaID"];
                    string ideaTitle = reader["IdeaTitle"].ToString();
                    string ideaText = reader["IdeaText"].ToString();
                    DateTime timeOfPost = Convert.ToDateTime(reader["TimeOfPost"]);
                    DateTime closureDate = Convert.ToDateTime(reader["ClosureDate"]);
                    //string timeOfPost = reader.GetDateTime(reader.GetOrdinal("TimeOfPost")).ToString("dd MMM yyyy");
                    //string closureDate = reader.GetDateTime(reader.GetOrdinal("ClosureDate")).ToString("dd MMM yyyy");
                    Boolean anonymous = (reader["Anonymous"] as int? == 1) ? true : false;

                    int user_id = (int)reader["UserID"];
                    string firstName = reader["Fname"].ToString();
                    string lastName = reader["Sname"].ToString();
                    string email = reader["Email"].ToString();
                    string password = reader["Password"].ToString();

                    int category_id = (int)reader["CategoryID"];
                    string categoryName = reader["CategoryName"].ToString();

                    int department_id = (int)reader["DepartmentID"];
                    string deptName = reader["DName"].ToString();

                    Department thisDept = new Department(department_id, deptName);
                    User thisUser = new User(user_id, firstName, lastName, email, password, thisDept);

                    Category thisCategory = new Category(category_id, categoryName);
                    thisIdea = new Idea(idea_id, ideaTitle, ideaText, timeOfPost, thisCategory, closureDate, thisUser, anonymous);
                    System.Diagnostics.Debug.Write("IDEA THAT HAS BEEN LOADED IS :" + thisIdea.IdeaTitle);
                    ideaList.Add(thisIdea);
                    System.Diagnostics.Debug.Write(ideaList.Count + " IDEAS HAVE BEEN LOADED");
                    //System.Diagnostics.Debug.WriteLine(idea_id + " " + ideaTitle + " " + ideaText);
                }
            }
            catch (Exception ex)
            {
                string exception = ("FAILED TO LOAD IDEAS - AN ERROR OCCURRED, " + ex);
                System.Diagnostics.Debug.Write(exception);
            }
            finally
            {
                myConnection.Close();
            }
             return ideaList;
        }

        public static bool AddIdea(User user, Category Catergory, string ideaTitle, string ideaText, DateTime TimeOfPost, DateTime ClosureDate, bool anonymous)
        {

            int rating;

            if (anonymous)
            {
                rating = 1;
            }
            else
            {
                rating = 0;
            }

            OleDbConnection myConnection = GetConnection();
                string myQuery = ("INSERT INTO Idea ([UserID], [CategoryID], [IdeaTitle], [IdeaText], [TimeOfPost], [ClosureDate], [Anonymous], [IdeaViews]) VALUES ('" + user.IdNumber + "', '" + Catergory.CategoryID + "', '" + ideaTitle + "', '" + ideaText + "', '" + TimeOfPost + "', '" + ClosureDate + "', '" + rating + "', '0')");
                System.Diagnostics.Debug.Write(myQuery);
                OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
                Boolean successBool = true;

                try
                {
                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    successBool = false;
                }
                finally
                {
                    myConnection.Close();
                }

            return successBool;
        }

        public static Boolean AddCategory(string categoryName)
        {
            int rowNum = GetRowID("Category");

            OleDbConnection myConnection = GetConnection();
            //string myQuery = "INSERT INTO [Category] ([CategoryID],[CategoryName]) VALUES ( '" + rowNum + "', '" + categoryName + "')";
            string myQuery = "INSERT INTO [Category] ([CategoryName]) VALUES (  '" + categoryName + "')";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static Category GetCategory(string catName)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT CategoryID, CategoryName FROM [Category] WHERE CategoryName = '" + catName +  "'");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Category thisCategory = null;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        int cat_id = (int)reader["CategoryID"];
                        string name = reader["CategoryName"].ToString();
                        thisCategory = new Category(cat_id, name);
                    }
                }
            }
            catch (Exception ex)
            {
                string exception = ("AN ERROR OCCURRED, " + ex);
                System.Diagnostics.Debug.Write(exception);
            }
            finally
            {
                myConnection.Close();
            }

            return thisCategory;
        }

        public static Boolean AddComment(Comment thisComment)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "INSERT INTO [Comment] ([IdeaID],[UserID], [CommentText], [TimeOfPost]) VALUES ( '" + thisComment.CommentIdea.IdeaID + "', '" + thisComment.CommentAuthor.IdNumber + "', '" + thisComment.CommentText + "', '" + thisComment.CommentDate + "')";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static void DeleteComment()
        {

        }

        public static Boolean AddViewToIdea(Idea thisIdea)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE[Idea] set [IdeaViews] = [IdeaViews] + 1 WHERE IdeaID = " +thisIdea.IdeaID + "";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static Boolean AddRating(Rating thisRating)
        {
            int rating;

            if (thisRating.ThumbRating)
            {
                rating = 1;
            } else
            {
                rating = 0;
            }

            OleDbConnection myConnection = GetConnection();
            string myQuery = "INSERT INTO [Rating] ([UserID], [IdeaID], [ThumbRating]) VALUES ( '" + thisRating.RatingAuthor.IdNumber + "', '" + thisRating.IdeaRated.IdeaID + "', '" + rating + "')";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static void DeleteRating()
        {

        }

        public static Boolean setClosureDate(DateTime time)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE [ClosureDates] SET [IdeaDate] = '" + time + "' WHERE ID = 1";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static Boolean setFinalClosereDate(DateTime time)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "UPDATE [ClosureDates] SET [FinalClosureDate] = '" + time + "' WHERE ID = 1";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            Boolean successBool = true;

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                successBool = false;
            }
            finally
            {
                myConnection.Close();
            }

            return successBool;
        }

        public static DateTime getIdeaClosureDate()
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "SELECT [IdeaDate] FROM [ClosureDates] WHERE ID = 1";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            DateTime ideaDate = DateTime.Parse("2012/12/12 15:00:00.000");

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    ideaDate = Convert.ToDateTime(reader["IdeaDate"]);
                    return ideaDate;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                myConnection.Close();
            }

            return ideaDate;
        }

        public static DateTime getFinalClosureDate()
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = "SELECT [FinalClosureDate] FROM [ClosureDates] WHERE ID = 1";
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            DateTime finalDate = DateTime.Parse("2012/12/12 15:00:00.000");

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                while (reader.Read())
                {
                    finalDate = Convert.ToDateTime(reader["FinalClosureDate"]);
                    return finalDate;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                myConnection.Close();
            }

            return finalDate;
        }

        private static int GetRowID(string tableName)
        {
            OleDbConnection myConnection = GetConnection();
            string myQuery = ("SELECT * FROM [" + tableName + "]");
            System.Diagnostics.Debug.Write(myQuery);
            OleDbCommand myCommand = new OleDbCommand(myQuery, myConnection);
            int rowNum = 10;

            try
            {
                myConnection.Open();
                OleDbDataReader reader = myCommand.ExecuteReader();

                if (reader.HasRows) {
                    while (reader.Read())
                    {
                        rowNum++;
                    }
                }
            }
            catch (Exception ex)
            {
                string exception = ("AN ERROR OCCURRED, " + ex);
                System.Diagnostics.Debug.Write(exception);
                return 0;
            }
            finally
            {
                myConnection.Close();
            }

            return rowNum;
        }

    }
}