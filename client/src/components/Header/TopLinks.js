import React, { useState } from "react";
import clsx from "clsx";

import JoinUsBlock from "./JoinUsBlock";
import SignInBlock from "./SignInBlock";
import AccountMenu from "./AccountMenu";
import Help from "./Help";

import styles from "./TopLinks.module.css";

// Redux-related
import { useIsLoggedIn } from "features/user/userSlice";

const ActiveFormContext = React.createContext({});

const TopLinks = () => {
  const isLoggedIn = useIsLoggedIn();

  return (
    <div className={clsx(styles["top-links"], "flex-start")}>
      <Help />
      <span>|</span>
      {(isLoggedIn && <AccountMenu />) || <Foo />}
    </div>
  );
};

const Foo = () => {
  const [activeForm, setActiveForm] = useState("");
  const handleFormChange = (name) => {
    setActiveForm(name);
  };

  return (
    <ActiveFormContext.Provider value={{ activeForm, handleFormChange }}>
      <JoinUsBlock />
      <span>|</span>
      <SignInBlock />
    </ActiveFormContext.Provider>
  );
};

export { ActiveFormContext };
export default TopLinks;
