import React, { useEffect, useRef, useState } from "react";

function withScrollControl(Component, slidingLength = 465) {
  return ({ ...props }) => {
    const [disabled, setDisabled] = useState({ left: true, right: false });
    const [noScroll, setNoScroll] = useState(false);

    const ref = useRef();

    const handleDisable = (s) => {
      setDisabled(s);
    };
    const handleSlideLeft = (toOtherSide) => {
      const r = ref.current;

      if (r.scrollLeft === 0 && toOtherSide) {
        r.scrollLeft = r.scrollWidth;
      } else r.scrollLeft -= slidingLength; // not updated right here.
      // after scrolling, "scrollLeft" is then updated.
    };
    const handleSlideRight = (toOtherSide) => {
      const r = ref.current;
      const l = r.scrollWidth - r.offsetWidth;

      const c =
        Math.round(r.scrollLeft) === Math.round(l - 1) ||
        Math.round(r.scrollLeft) === Math.round(l) ||
        Math.round(r.scrollLeft) === Math.round(l + 1);

      if (c && toOtherSide) {
        r.scrollLeft = 0;
      } else r.scrollLeft += slidingLength;
    };

    useEffect(() => {
      const r = ref.current;

      const handleScroll = () => {
        let scrollLeft = r.scrollLeft;
        let scrollWidth = r.scrollWidth;
        let carouselWidth = r.offsetWidth;

        const inviewWidth = scrollWidth - carouselWidth;
        const approx = Math.round(scrollLeft) >= Math.round(inviewWidth);
        const lilOffet = Math.round(scrollLeft) >= Math.round(inviewWidth - 2);

        const rightEnd = approx || lilOffet;
        const leftEnd = scrollLeft <= 0;

        handleDisable({ right: rightEnd, left: leftEnd });
      };

      r.addEventListener("scroll", handleScroll);

      return () => r.removeEventListener("scroll", handleScroll);
    }, []);

    useEffect(() => {
      const handleResize = () => {
        const r = ref.current;
        const c = r.scrollWidth <= r.clientWidth;

        if (c) {
          setNoScroll(true);
          setDisabled({ left: true, right: true });
        }
      };

      const timeID = setTimeout(() => handleResize(), 500);
      window.addEventListener("resize", handleResize);

      return () => {
        clearTimeout(timeID);
        window.removeEventListener("resize", handleResize);
      };
    }, []);

    return (
      <Component
        ref={ref}
        disabled={disabled}
        noScroll={noScroll}
        handleSlideLeft={handleSlideLeft}
        handleSlideRight={handleSlideRight}
        {...props}
      />
    );
  };
}

export default withScrollControl;
