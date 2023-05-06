import React, { useState, useEffect } from "react";

import { lis } from "./index";
import { CardDropdown } from "./CardDropDown";
import { Link } from "react-router-dom";

function Help() {
  const [list, setList] = useState([]);

  useEffect(() => {
    setList(lis);
  }, []);

  return (
    <div className="position-relative">
      <Link to="/help" className="capitalized-text hover-w-fade">
        Help
      </Link>
      <div className="hidden">
        <CardDropdown titleHref="/help" title="Help" list={list}>
          <ul>
            {list.map((li, i) => {
              return (
                <li key={i}>
                  <Link to={li.path}>{li.text}</Link>
                </li>
              );
            })}
          </ul>
        </CardDropdown>
      </div>
    </div>
  );
}

export default Help;
