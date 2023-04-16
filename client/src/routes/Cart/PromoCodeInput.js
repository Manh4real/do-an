import React, { useState } from "react";

import { ArrowIcon } from "components/Icons";
import Input from "./PromoInputTag";

const PromoCodeInput = () => {
  const [expanded, setExpanded] = useState(false);

  const handleExpand = () => {
    setExpanded((prev) => !prev);
  };

  return (
    <div className="bag__promote-code regular-font bag__summary-row">
      <div className="flex-start">
        <button className="regular-font flex-start" onClick={handleExpand}>
          Do you have a Promo code?
          <ArrowIcon toggle={expanded} />
        </button>
      </div>
      <Input show={expanded} />
    </div>
  );
};

export default PromoCodeInput;
