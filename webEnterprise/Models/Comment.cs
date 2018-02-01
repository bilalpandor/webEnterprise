using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Comment
    {
        private string commentText;
        private DateTime commentDate;
        private User commentAuthor;

        public string CommentText
        {
            get
            {
                return commentText;
            }

            set
            {
                commentText = value;
            }
        }

        public DateTime CommentDate
        {
            get
            {
                return commentDate;
            }

            set
            {
                commentDate = value;
            }
        }

        public User CommentAuthor
        {
            get
            {
                return commentAuthor;
            }

            set
            {
                commentAuthor = value;
            }
        }

        public Comment(string text, DateTime date, User user)
        {
            this.CommentText = text;
            this.CommentDate = date;
            this.CommentAuthor = user;
        }

        public void SubmitComment()
        {

        }

        public void PostAnonymously()
        {

        }

        public void EmailIdeaAuthor()
        {

        }
    }
}