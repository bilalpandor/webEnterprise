using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webEnterprise.Models
{
    public class Rating
    {
        private Boolean thumbRating;
        private User ratingAuthor;
        private Idea ideaRated;


        public bool ThumbRating
        {
            get
            {
                return thumbRating;
            }

            set
            {
                thumbRating = value;
            }
        }

        public User RatingAuthor
        {
            get
            {
                return ratingAuthor;
            }

            set
            {
                ratingAuthor = value;
            }
        }

        public Idea IdeaRated {
            get
            {
                return ideaRated;
            }

            set
            {
                ideaRated = value;
            }
        }


        public Rating(bool thumbRating, User ratingAuthor, Idea ideaRated)
        {
            this.ThumbRating = thumbRating;
            this.RatingAuthor = ratingAuthor;
            this.IdeaRated = ideaRated;

        }

        public void SubmitRating()
        {

        }

        public void CheckUserRatingHistory()
        {

        }
    }
}