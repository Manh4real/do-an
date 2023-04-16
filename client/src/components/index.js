import React from "react";
import ReactDOM from "react-dom";

export const toModalRoot = (Component) => {
  return React.forwardRef((props, ref) => {
    return ReactDOM.createPortal(
      <Component ref={ref} {...props} />,
      document.getElementById("modal-root")
    );
  });
};
