import React, { useState } from "react";

import { ArrowIcon } from "../Icons";
import StyledDetailsTag from "./StyledDetailTag";

function DetailsTag({ className, open = false, summary, children }) {
  const [value, setValue] = useState(open);

  const handleClick = (e) => {
    e.preventDefault();
    setValue((prev) => !prev);
  };

  return (
    <StyledDetailsTag className={className} open={value}>
      <summary onClick={handleClick} className="regular-font text-left">
        {summary}
        <ArrowIcon toggle={value} />
      </summary>
      {children}
    </StyledDetailsTag>
  );
}

export default DetailsTag;
