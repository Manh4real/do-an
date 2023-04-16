import React from "react";
import clsx from "clsx";

import Mask from "../Mask/Mask";
import styles from "./SearchSuggestionContainer.module.css";

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
      <a href={"/shop/?search=air+force+1"} className="bigger-font">
        Air Force 1
      </a>
      <a href={"/shop/?search=jordan"} className="bigger-font">
        Jordan
      </a>
      <a href={"/shop/?search=air+max"} className="bigger-font">
        Air Max
      </a>
      <a href={"/shop/?search=blazer"} className="bigger-font">
        Blazer
      </a>
      <a href={"/shop/?search=gifts"} className="bigger-font">
        Gifts
      </a>
    </div>
  );
};

export default SearchSuggestionContainer;
