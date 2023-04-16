import React, { useState } from "react";

import { withSubmit } from "hoc";
import { REVIEW } from "script";
import StyledForm from "./StyledForm";
import clsx from "clsx";
import { Star } from "components/Icons";

function Form({ processing, first, setFirst, handleSubmit, validation }) {
  return (
    <StyledForm method="post" onSubmit={handleSubmit}>
      <header>
        <div className="title">WRITE A REVIEW</div>
        <p className="subtitle">Please share your experience.</p>
      </header>

      <div className="form-group rating">
        <label>
          Overall rating<sup className="red-font">*</sup>
        </label>
        <div className="form-control-container">
          <RatingInput validateRating={validation.validateReviewRating} />
        </div>
      </div>
      <div className="form-group">
        <label>
          Review<sup className="red-font">*</sup>
        </label>
        <div className="form-control-container">
          <ReviewInput
            first={first}
            setFirst={setFirst}
            validateReview={validation.validateReview}
          />
          <p className="form-info">
            <svg
              aria-hidden="true"
              focusable="false"
              viewBox="0 0 24 24"
              width={12}
              height={12}
              fill="currentColor"
            >
              <path d="M12 .25A11.75 11.75 0 1023.75 12 11.76 11.76 0 0012 .25zm0 21.15a9.4 9.4 0 119.4-9.4 9.41 9.41 0 01-9.4 9.4z"></path>
              <path d="M13.18 15.53v-4.7A1.17 1.17 0 0012 9.65H9.65V12h1.17v3.53H8.48v2.35h7.05v-2.35z"></path>
              <circle cx="12" cy="7.3" r="1.47"></circle>
            </svg>{" "}
            Make your review great: Describe what you liked, what you didn't
            like, and other key things shoppers should know (minimum 5
            characters, maximum 500 characters)
          </p>
        </div>
      </div>
      <div className="form-group">
        <label>Review title</label>
        <div className="form-control-container">
          <ReviewTitleInput
            validateReviewTitle={validation.validateReviewTitle}
          />
          <p className="form-info">
            <svg
              aria-hidden="true"
              focusable="false"
              viewBox="0 0 24 24"
              width={12}
              height={12}
              fill="currentColor"
            >
              <path d="M12 .25A11.75 11.75 0 1023.75 12 11.76 11.76 0 0012 .25zm0 21.15a9.4 9.4 0 119.4-9.4 9.41 9.41 0 01-9.4 9.4z"></path>
              <path d="M13.18 15.53v-4.7A1.17 1.17 0 0012 9.65H9.65V12h1.17v3.53H8.48v2.35h7.05v-2.35z"></path>
              <circle cx="12" cy="7.3" r="1.47"></circle>
            </svg>{" "}
            Your overall impression (50 characters or less)
          </p>
        </div>
      </div>
      <button type="submit">{processing ? "PROCESSING..." : "SUBMIT"}</button>
    </StyledForm>
  );
}

export const MAX_RATING_STARS = 5;
const RatingInput = ({ validateRating }) => {
  const [value, setValue] = useState(MAX_RATING_STARS);

  const handleChange = (e) => {
    let stars = Number(e.target.value);

    if (!stars) return;

    stars = Math.floors(stars);

    if (stars <= MAX_RATING_STARS && stars > 0) {
      setValue(stars);
    }
  };

  return (
    <React.Fragment>
      {new Array(MAX_RATING_STARS).fill(0).map((_, i) => {
        const thisStarCount = i + 1;

        return (
          <Star
            key={i}
            width={20}
            height={20}
            fill={thisStarCount <= value ? "#000" : "#ddd"}
            onClick={() => {
              setValue(thisStarCount);
            }}
          />
        );
      })}
      <input
        className={clsx({
          "is--error": validateRating(value),
        })}
        type="number"
        name="rating"
        min={1}
        max={MAX_RATING_STARS}
        value={value}
        onChange={handleChange}
      />
    </React.Fragment>
  );
};

const ReviewInput = ({ first, setFirst, validateReview }) => {
  const [value, setValue] = useState("");
  // const [first, setFirst] = useState(true); // first shown

  const handleChange = (e) => {
    setValue(e.target.value);
    setFirst(false);
  };

  return (
    <textarea
      className={clsx({
        "is--error": !first && validateReview(value),
      })}
      name="review"
      value={value}
      onChange={handleChange}
    />
  );
};

const ReviewTitleInput = ({ validateReviewTitle }) => {
  const [value, setValue] = useState("");

  const handleChange = (e) => {
    setValue(e.target.value);
    validateReviewTitle(e.target.value);
  };

  return (
    <input
      className={clsx({
        "is--error": validateReviewTitle(value),
      })}
      type="text"
      name="reviewTitle"
      value={value}
      onChange={handleChange}
    />
  );
};

export default withSubmit(Form, REVIEW);
