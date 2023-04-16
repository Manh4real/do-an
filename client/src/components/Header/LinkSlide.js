import React, { useEffect, useRef } from "react";
import { Link } from "react-router-dom";

import styles from "./LinkSlide.module.css";

const LinkSlide = () => {
  const r = useRef();

  useEffect(() => {
    const rr = r.current;
    let count = -1;

    function slide() {
      if (count >= rr.children.length - 1) count = -1;
      ++count;
      [].forEach.call(rr.children, translate);
    }
    function translate(link) {
      link.style.transform = `translateX(-${count * 100}%)`;
    }
    slide();

    const timeID = setInterval(slide, 5000);

    return () => clearInterval(timeID);
  }, []);

  return (
    <div ref={r} className={styles["link-slide"]}>
      {[1, 2, 3].map((i) => (
        <div key={i}>
          <p className="font-14">
            Free Shipping + Returns, Free Membership, Exclusive Products
          </p>
          <Link to="/join-us" className="font-14 text-underline">
            Join Now
          </Link>
        </div>
      ))}
    </div>
  );
};

export default LinkSlide;
