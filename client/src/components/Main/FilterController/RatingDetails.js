import { Star } from "components/Icons";
import { MAX_RATING_STARS } from "../../../constants";
import React from "react";
import { DetailsTag } from "components/DetailsTag";
import clsx from "clsx";
import { useNavigate, useSearchParams } from "react-router-dom";

function RatingDetails() {
  const navigate = useNavigate();
  const [searchParams, setSearchParams] = useSearchParams();

  let restSearchParams = "";
  if (searchParams.toString() !== "") {
    restSearchParams = "&" + searchParams.toString();
  }

  return (
    <DetailsTag open summary="Search by rating:" className={clsx("filter-ctg")}>
      {new Array(MAX_RATING_STARS).fill(0).map((_, i) => {
        const count = MAX_RATING_STARS - i;

        return (
          <React.Fragment key={i}>
            <input
              type="checkbox"
              name="rating"
              id={"rating-" + count}
              className="d-hidden"
              checked={searchParams.getAll("rating").includes(count.toString())}
              value={count}
              onChange={() => {
                if (searchParams.getAll("rating").includes(count.toString())) {
                  let ratings = searchParams.getAll("rating");
                  ratings = ratings.filter(
                    (rating) => rating !== count.toString()
                  );

                  const restSearchParams = Array.from(
                    searchParams.entries()
                  ).filter(([key]) => key !== "rating");

                  setSearchParams([
                    ...ratings.map((rating) => ["rating", rating]),
                    ...restSearchParams,
                  ]);
                } else {
                  navigate("?rating=" + count + restSearchParams);
                }
              }}
            />
            <label htmlFor={"rating-" + count} className="flex-start">
              ({count})
              <Star width={16} height={16} count={count} />
            </label>
          </React.Fragment>
        );
      })}
    </DetailsTag>
  );
}

export default RatingDetails;
