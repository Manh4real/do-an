import React, { useState, useEffect } from "react";

import { lis } from "./index";
import { CardDropdown } from "./CardDropDown";

function Help() {
  const [list, setList] = useState([]);

  useEffect(() => {
    setList(lis);
  }, []);

  return (
    <div className="position-relative">
      <a href="/help" className="capitalized-text hover-w-fade">
        Help
      </a>
      <div className="hidden">
        <CardDropdown titleHref="/help" title="Help" list={list}>
          <ul>
            {list.map((li, i) => {
              return (
                <li key={i}>
                  <a href={li.path}>{li.text}</a>
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
