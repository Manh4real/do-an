import React, { useRef, useContext, useEffect } from "react";

import { DropdownContext } from "../Header/MenuLinks";

function withEvent(Mask) {
  return (props) => {
    const ref = useRef();
    const { removeDropdown, active } = useContext(DropdownContext);

    useEffect(() => {
      const c = ref.current;
      if (removeDropdown) c.addEventListener("mouseenter", removeDropdown);
      return () => c.removeEventListener("mouseenter", removeDropdown);
    }, [removeDropdown, active]);

    return <Mask ref={ref} {...props} />;
  };
}

export { withEvent };
