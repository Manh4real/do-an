import React from "react";
import { Link, Navigate, useLocation } from "react-router-dom";

import StyledOrderSuccessInform from "./StyledOrderSuccessInform";

function OrderSuccessInform() {
  const location = useLocation();

  if (!location.state?.placeOrderSuccess) {
    return <Navigate to="/" replace={true} />;
  }

  return (
    <StyledOrderSuccessInform className="order-success">
      <div className="check-container">
        <div className="check-background">
          <svg
            viewBox="0 0 65 51"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M7 25L27.3077 44L58.5 7"
              stroke="white"
              strokeWidth="13"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        </div>
      </div>

      <h2 className="bold-font">Thank you for your order!</h2>
      <p className="medium-font">
        Your order has been successfully placed and will be shipped to your
        address soon.
      </p>

      <Link
        to="/orders"
        className="btn cta bold-font large-font uppercase-text hover-w-fade"
      >
        Track Order
      </Link>
    </StyledOrderSuccessInform>
  );
}

export default OrderSuccessInform;
