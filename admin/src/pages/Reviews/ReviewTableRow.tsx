import React, { useEffect, useState, useMemo } from "react";
import { IReview } from "../../types";
import moment from "moment";
import { Star } from "../../Icons";
import {
  getDownloadImage,
  getDownloadUserAvatar,
} from "../../features/firebase";
import DeleteButton from "./DeleteButton";

interface Props {
  nth: number;
  review: IReview;
}
const MAX_RATING_STARS = 5;
function ReviewTableRow({ nth, review }: Props) {
  const [userAvatar, setUserAvatar] = useState("");
  const [imageUrl, setImageUrl] = useState("");

  // first image with first color
  const firstImageName =
    review.images[Object.keys(review.images)[0]]?.[0].url ||
    "default-product-image.png";

  useEffect(() => {
    let ignore = false;
    getDownloadImage(firstImageName).then((url) => {
      if (!ignore) {
        url && setImageUrl(url);
      }
    });

    return () => {
      ignore = true;
    };
  }, [firstImageName]);

  useEffect(() => {
    getDownloadUserAvatar(review.avatar).then((url) => {
      if (url) setUserAvatar(url);
    });
  }, [review.avatar]);

  const dateString = useMemo(
    () =>
      moment(review.created_at)
        .format("ddd, MMM DD, YYYY, h:mm:ss a")
        .toLocaleString(),
    [review.created_at]
  );

  return (
    <tr className="align-top">
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        {nth}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        <div className="flex items-center gap-3">
          {imageUrl ? (
            <img
              className="object-cover w-10 h-10 rounded-lg"
              src={imageUrl}
              alt=""
            />
          ) : (
            <div className="object-cover w-10 h-10 rounded-lg bg-gray-50 ring-1 ring-gray-400"></div>
          )}
          {review.product_name}
        </div>
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        <div className="flex gap-3">
          {userAvatar ? (
            <img
              src={userAvatar}
              className="w-10 h-10 rounded-full object-cover"
              alt=""
            />
          ) : (
            <div className="w-10 h-10 rounded-full bg-gray-200"></div>
          )}
          <div>
            {review.user_name}
            <p className="text-gray-400 text-sm">{review.email}</p>
          </div>
        </div>
      </td>
      <td className="max-w-xs px-4 py-4 text-sm text-gray-700">
        <div className="flex justify-center items-center w-max mb-2">
          <Stars rating={review.rating} />
        </div>
        <p className="text-gray-700 text-base font-semibold mb-2">
          {review.title}
        </p>
        <ReviewText text={review.review} />
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        {dateString}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        <DeleteButton productId={review.product_id} userId={review.user_id} />
      </td>
    </tr>
  );
}

const Stars = ({ rating }: { rating: number }) => {
  return (
    <>
      {new Array(rating).fill("").map((_, i) => (
        <span key={i} className="text-yellow-400">
          <Star />
        </span>
      ))}
      {new Array(MAX_RATING_STARS - rating).fill("").map((_, i) => (
        <span key={i} className="text-gray-300">
          <Star />
        </span>
      ))}
    </>
  );
};

const MAX_DISPLAY_LENGTH = 150;
const ReviewText = ({ text }: { text: string }) => {
  const [expand, setExpand] = useState(false);

  return (
    <p className="text-gray-700 text-sm">
      {text.slice(0, MAX_DISPLAY_LENGTH)}
      {expand && text.slice(MAX_DISPLAY_LENGTH)}
      {text.length > MAX_DISPLAY_LENGTH && (
        <>
          {!expand && "..."}
          <span
            onClick={() => {
              setExpand((prev) => !prev);
            }}
            className="ml-1 cursor-pointer underline underline-offset-2 font-semibold"
          >
            {expand ? "See less" : "See more"}
          </span>
        </>
      )}
    </p>
  );
};

export default ReviewTableRow;
