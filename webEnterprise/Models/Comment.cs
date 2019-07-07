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
        private Idea commentIdea;

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

        public Idea CommentIdea
        {
            get
            {
                return commentIdea;
            }

            set
            {
                commentIdea = value;
            }
        }

        public Comment(string text, DateTime date, User user, Idea idea)
        {
            this.CommentText = text;
            this.CommentDate = date;
            this.CommentAuthor = user;
            this.commentIdea = idea;
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