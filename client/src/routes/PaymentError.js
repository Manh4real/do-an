import React from "react";
import StyledPaymentError from "./StyledPaymentError";

function PaymentError() {
  return (
    <StyledPaymentError>
      <div className="red-font">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill="#d43f21"
          className="red-font"
        >
          <path
            fillRule="evenodd"
            d="M9.401 3.003c1.155-2 4.043-2 5.197 0l7.355 12.748c1.154 2-.29 4.5-2.599 4.5H4.645c-2.309 0-3.752-2.5-2.598-4.5L9.4 3.003zM12 8.25a.75.75 0 01.75.75v3.75a.75.75 0 01-1.5 0V9a.75.75 0 01.75-.75zm0 8.25a.75.75 0 100-1.5.75.75 0 000 1.5z"
            clipRule="evenodd"
          />
        </svg>
      </div>

      <h2>
        <span className="red-font">Failed:</span> Payment has not been
        completed.
      </h2>
      <p className="mt-25 regular-font">Please try it later</p>
    </StyledPaymentError>
  );
}

export default PaymentError;
