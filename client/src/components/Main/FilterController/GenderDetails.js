import React, { useState } from "react";

import { DetailsTag } from "components/DetailsTag";
import { useSearchParams } from "react-router-dom";

import GenderInput from "./GenderInput";
// import { setGender } from "./actions";

const GenderDetails = ({ handleClick }) => {
  const [searchParams] = useSearchParams();
  const [, setGender] = useState(searchParams.get("of"));

  const handleChange = (gender) => {
    setGender(gender);
  };

  return (
    <>
      <DetailsTag open summary="Gender: " className="filter-ctg gender-ctn">
        <GenderInput
          handleClick={handleClick}
          handleChange={() => handleChange("male")}
          id="m-gender"
          gender="male"
          checked={searchParams.get("gender") === "male"}
        />
        <GenderInput
          handleClick={handleClick}
          handleChange={() => handleChange("female")}
          id="f-gender"
          gender="female"
          checked={searchParams.get("gender") === "female"}
        />
        <GenderInput
          handleClick={handleClick}
          handleChange={() => handleChange("unisex")}
          id="u-gender"
          gender="unisex"
          checked={searchParams.get("gender") === "unisex"}
        />
      </DetailsTag>
      {/* <DetailsTag open summary="Kids: " className="filter-ctg kids-gender-ctn">
        <div>
          <input
            type="radio"
            name="gender"
            id="b-gender"
            // checked={boyCbChecked}
            // onChange={handleBoyCbCheckedChange}
          />
          <label
            htmlFor="b-gender"
            onClick={() => handleClick({ filter: "gender", of: "boy" })}
          >
            Boys
          </label>
          <br />
        </div>
        <div>
          <input
            type="radio"
            name="gender"
            id="g-gender"
            // checked={girlCbChecked}
            // onChange={handleGirlCbCheckedChange}
          />
          <label
            htmlFor="g-gender"
            onClick={() => handleClick({ filter: "gender", of: "girl" })}
          >
            Girls
          </label>
        </div>
      </DetailsTag> */}
    </>
  );
};

export default GenderDetails;
