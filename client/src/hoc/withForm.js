import React, { useState, useContext } from "react";

import { ActiveFormContext } from "components/Header/TopLinks";

function withForm(FormBlock) {
  return (props) => {
    const [show, setShow] = useState(false);

    const { activeForm, handleFormChange } = useContext(ActiveFormContext);

    const onClose = () => {
      setShow(false);
      handleFormChange("");
    };
    const onReplace = () => {
      setShow(false);
    };
    const handleClick = (e) => {
      e.preventDefault();
      setShow(true);
    };

    return (
      <FormBlock
        activeForm={activeForm}
        show={show}
        onReplace={onReplace}
        onClose={onClose}
        handleClick={handleClick}
        {...props}
      />
    );
  };
}

export default withForm;
