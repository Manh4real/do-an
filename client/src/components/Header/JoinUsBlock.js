import React from "react";
import { Link, useLocation } from "react-router-dom";

import withForm from "../../hoc/withForm";
import JoinUs from "../JoinUs/JoinUs";
import { SIGN_UP } from "script";

function JoinUsBlock({ handleClick, activeForm, show, onClose, onReplace }) {
  const location = useLocation();

  return (
    <div className="join-us-form">
      <Link to="/" onClick={handleClick} state={{ from: location }}>
        Join Us
      </Link>
      {(activeForm === SIGN_UP || show) && (
        <JoinUs
          onClose={onClose}
          isShown={show || activeForm === SIGN_UP}
          onReplace={onReplace}
        />
      )}
    </div>
  );
}

export default React.memo(withForm(JoinUsBlock));
// export default React.forwardRef(JoinUsBlock);
