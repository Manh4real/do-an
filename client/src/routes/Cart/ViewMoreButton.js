import React from "react";

const ViewMoreButton = ({ handleClick, children }) => {
  return (
    <button
      className="view-more-btn grey-font small-font underlined"
      onClick={handleClick}
    >
      View {children} Favorites
    </button>
  );
};

export default ViewMoreButton;
