import React from "react";
import { setAccessTokenAtLocalStorage } from "../../helpers";
import { Navigate } from "react-router-dom";

function Logout() {
  setAccessTokenAtLocalStorage("");

  return <Navigate to="/sign-in" replace={true} />;
}

export default Logout;
