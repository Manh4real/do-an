import React, { useState } from "react";

import { MAX_PREVIEW_REVIEW_LENGTH, MAX_RATING_STARS } from "../../constants";
import { Star } from "components/Icons";

function ReviewRow({ review }) {
  const [readMore, setReadMore] = useState(false);

  return (
    <div className="review-row">
      <div className="left">
        <Star width={16} height={16} count={review.rating || 0} />
        <Star
          width={16}
          height={16}
          count={MAX_RATING_STARS - review.rating || 0}
          fill="#ddd"
        />
      </div>
      <div className="right">
        <div className="title font-24">{review.title}</div>
        <div className="review">
          {review.review.slice(0, MAX_PREVIEW_REVIEW_LENGTH)}
          {review.review.length > MAX_PREVIEW_REVIEW_LENGTH && "..."}
          {review.review.length > MAX_PREVIEW_REVIEW_LENGTH &&
            readMore &&
            review.review.slice(MAX_PREVIEW_REVIEW_LENGTH)}
          {review.review.length > MAX_PREVIEW_REVIEW_LENGTH && (
            <span
              className="underlined readmore"
              onClick={() => {
                setReadMore((prev) => !prev);
              }}
            >
              Read {readMore ? "less" : "more"}
            </span>
          )}
        </div>
        <div className="author mt-25 small-font">{review.user_name}</div>
        <div className="date mt-15 grey-font small-font">
          {review.created_at.slice(0, 10)}
        </div>
      </div>
    </div>
  );
}

export default ReviewRow;
