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

        public Rating(bool thumbRating, User ratingAuthor)
        {
            this.ThumbRating = thumbRating;
            this.RatingAuthor = ratingAuthor;
        }

        public void SubmitRating()
        {

        }

        public void CheckUserRatingHistory()
        {

        }
    }
}