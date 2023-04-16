import React from "react";
import { TailSpin } from "react-loader-spinner";

function Spinner({ className }) {
  return <TailSpin className={className} width="32" height="32" color="#111" />;
}

export default Spinner;
