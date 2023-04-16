import React from "react";
import { NavLink } from "react-router-dom";

function Colors({ imageColors, handleColorChange }) {
  return (
    <div className="items">
      {Object.keys(imageColors).map((key) => {
        return (
          <NavLink
            to={"" + key}
            key={key}
            onClick={() => handleColorChange(key)}
          >
            <img src={imageColors[key]} alt=""></img>
          </NavLink>
        );
      })}
    </div>
  );
}

export default Colors;
