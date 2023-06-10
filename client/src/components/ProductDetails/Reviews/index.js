import React, { useEffect, useState } from "react";

import { DetailsTag } from "../Info";
import { Star } from "components/Icons";

import { getReviews } from "services/reviews";
import WriteReview from "./WriteReview";
import { MAX_RATING_STARS } from "./Form";
import { Link } from "react-router-dom";
import { MAX_PREVIEW_REVIEW_LENGTH } from "../../../constants";

function Reviews({ productId }) {
  const [reviews, setReviews] = useState([]);
  const [meta, setMeta] = useState({
    avg: 0,
    total: 0,
  });

  useEffect(() => {
    const controller = new AbortController();

    getReviews(productId, 1, { signal: controller.signal }).then((result) => {
      setReviews(result.data.reviews);
      setMeta({
        total: result.meta.total || 0,
        avg: result.meta.avg || 0,
      });
    });

    return () => {
      controller.abort();
    };
  }, [productId]);

  return (
    <DetailsTag
      summary={`Reviews (${meta.total})`}
      icon={
        <span>
          <Star width={16} height={16} count={Math.trunc(meta.avg) || 0} />
          <Star
            width={16}
            height={16}
            count={MAX_RATING_STARS - Math.trunc(meta.avg) || 0}
            fill="#ddd"
          />
        </span>
      }
    >
      <div className="flex-start mb-10">
        <Star width={16} height={16} count={Math.trunc(meta.avg) || 0} />
        <Star
          width={16}
          height={16}
          count={MAX_RATING_STARS - Math.trunc(meta.avg) || 0}
          fill="#ddd"
        />
        <span className="ml-5">{(Number(meta.avg) || 0).toFixed(1)} stars</span>
      </div>
      <WriteReview productId={productId} />
      {reviews.map((review, i) => (
        <Review key={i} review={review} />
      ))}
      {reviews.length === 0 && (
        <p className="mb-25">Have your say. Be the first to review.</p>
      )}
      {reviews.length > 1 && (
        <Link
          to={"/reviews/" + productId}
          className="inline-block underlined hover-w-fade medium-font mt-15"
        >
          More Reviews
        </Link>
      )}
    </DetailsTag>
  );
}

const Review = ({ review }) => {
  const [readMore, setReadMore] = useState(false);

  return (
    <div style={{ marginBottom: 50 }}>
      <div className="regular-font fw-medium">{review.title}</div>
      <div className="flex flex-start">
        <div className="flex-center">
          <Star width={14} height={14} count={review.rating || 0} />
          <Star
            width={14}
            height={14}
            count={MAX_RATING_STARS - review.rating || 0}
            fill="#ddd"
          />
        </div>
        <span className="grey-font regular-font" style={{ marginLeft: 10 }}>
          {new Date(review.created_at).toLocaleDateString("us")}
        </span>
      </div>
      <p className="mt-15 regular-font">
        {review.review.slice(0, MAX_PREVIEW_REVIEW_LENGTH)}
        {review.review.length > MAX_PREVIEW_REVIEW_LENGTH && "..."}
        {review.review.length > MAX_PREVIEW_REVIEW_LENGTH &&
          readMore &&
          review.review.slice(MAX_PREVIEW_REVIEW_LENGTH)}
        {review.review.length > MAX_PREVIEW_REVIEW_LENGTH && (
          <span
            className="underlined ml-10"
            onClick={() => {
              setReadMore((prev) => !prev);
            }}
          >
            Read {readMore ? "less" : "more"}
          </span>
        )}
      </p>
      <div className="font-14 grey-font mt-15">{review.user_name}</div>
    </div>
  );
};

export default Reviews;
