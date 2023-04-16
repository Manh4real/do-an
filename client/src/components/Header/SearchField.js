import React, { useState, useRef } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import clsx from "clsx";

import { SearchIcon } from "components/Icons";
import styles from "./SearchField.module.css";

function SearchField({ isExpanded, onClick: onInputClick, removeSuggestion }) {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();

  const [input, setInput] = useState(searchParams.get("search") || "");
  const inputRef = useRef();

  const handleChange = (e) => {
    setInput(e.target.value);
  };

  const handleInputClick = (e) => {
    if (isExpanded) return;

    onInputClick();
    inputRef.current.focus();
  };
  const handleSearchBtnClick = (e) => {
    if (!isExpanded) {
      onInputClick();
      inputRef.current.focus();
      return;
    }
    handleSearch(e);
  };
  const handleKeyDown = (e) => {
    if (e.key === "Enter") {
      handleSearch(e);
    }
  };
  const handleSearch = () => {
    if (input) {
      setTimeout(() => {
        navigate(`/shop?search=${input}`);
      }, 100);

      removeSuggestion();
      return;
    }
  };

  return (
    <div
      className={clsx(styles["search-field-ctn"], {
        [styles["expanded"]]: isExpanded,
      })}
    >
      <div className={styles["search-field"]}>
        <button tabIndex="-1" onClick={handleSearchBtnClick}>
          <SearchIcon />
        </button>
        <input
          ref={inputRef}
          value={input}
          onChange={handleChange}
          onClick={handleInputClick}
          onFocus={handleInputClick}
          onKeyDown={handleKeyDown}
          id={styles["srch"]}
          placeholder="Search"
          autoComplete="off"
        />
      </div>
    </div>
  );
}

export default SearchField;
