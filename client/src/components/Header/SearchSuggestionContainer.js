import React from "react";
import clsx from "clsx";

import Mask from "../Mask/Mask";
import styles from "./SearchSuggestionContainer.module.css";
import { Link } from "react-router-dom";

function SearchSuggestionContainer({ isShown, removeSuggestion }) {
  return (
    <div
      className={clsx({
        [styles["suggestion-container"]]: true,
        [styles["active"]]: isShown,
      })}
    >
      <Content />
      {isShown && <Mask isShown={isShown} onClick={removeSuggestion} />}
    </div>
  );
}

const Content = () => {
  return (
    <div>
      <div className={styles["title"]}>
        <h4 className="regular-font capitalized-text">Popular search terms</h4>
      </div>
      <Link to={"/shop/?search=air+force+1"} className="bigger-font">
        Air Force 1
      </Link>
      <Link to={"/shop/?search=jordan"} className="bigger-font">
        Jordan
      </Link>
      <Link to={"/shop/?search=air+max"} className="bigger-font">
        Air Max
      </Link>
      <Link to={"/shop/?search=blazer"} className="bigger-font">
        Blazer
      </Link>
      <Link to={"/shop/?search=gifts"} className="bigger-font">
        Gifts
      </Link>
    </div>
  );
};

export default SearchSuggestionContainer;
