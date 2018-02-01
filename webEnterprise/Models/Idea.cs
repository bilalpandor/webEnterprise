using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Idea
    {
        private string ideaTitle;
        private string ideaText;
        private DateTime timeOfPost;
        private Comment[] comments;
        private Category category;
        private DateTime closureDate;
        private User ideaAuthor;

        public string IdeaTitle
        {
            get
            {
                return ideaTitle;
            }

            set
            {
                ideaTitle = value;
            }
        }

        public string IdeaText
        {
            get
            {
                return ideaText;
            }

            set
            {
                ideaText = value;
            }
        }

        public DateTime TimeOfPost
        {
            get
            {
                return timeOfPost;
            }

            set
            {
                timeOfPost = value;
            }
        }

        public Comment[] Comments
        {
            get
            {
                return comments;
            }

            set
            {
                comments = value;
            }
        }

        public Category Category
        {
            get
            {
                return category;
            }

            set
            {
                category = value;
            }
        }

        public DateTime ClosureDate
        {
            get
            {
                return closureDate;
            }

            set
            {
                closureDate = value;
            }
        }

        public User IdeaAuthor
        {
            get
            {
                return ideaAuthor;
            }

            set
            {
                ideaAuthor = value;
            }
        }

        public Idea(string ideaTitle, string ideaText, DateTime timeOfPost, Comment[] comments, Category category, DateTime closureDate, User ideaAuthor)
        {
            this.IdeaTitle = ideaTitle;
            this.IdeaText = ideaText;
            this.TimeOfPost = timeOfPost;
            this.Comments = comments;
            this.Category = category;
            this.ClosureDate = closureDate;
            this.IdeaAuthor = ideaAuthor;
        }

        public void SubmitIdea()
        {

        }

        public void UploadDocument()
        {

        }

        public void EmailQACoordinator()
        {

        }

        public void PostAnonymously()
        {

        }
    }
}