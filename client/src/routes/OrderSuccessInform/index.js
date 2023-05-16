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

      {/* <table className="mb-50">
        <tbody>
          <tr>
            <th>Order ID: </th>
            <td></td>
          </tr>
          <tr>
            <th>Amount: </th>
            <td>{vnp_Amount}</td>
          </tr>
          <tr>
            <th>Order Description: </th>
            <td>{vnp_OrderInfo}</td>
          </tr>
          <tr>
            <th>Response code: </th>
            <td>{vnp_ResponseCode}</td>
          </tr>
          <tr>
            <th>Transaction No: </th>
            <td>{vnp_TransactionNo}</td>
          </tr>
          <tr>
            <th>Card type: </th>
            <td>{vnp_CardType}</td>
          </tr>
          <tr>
            <th>Bank code: </th>
            <td>{vnp_BankCode}</td>
          </tr>
          <tr>
            <th>Pay date: </th>
            <td>{vnp_PayDate}</td>
          </tr>
          <tr>
            <th>Transaction Status: </th>
            <td>{vnp_TransactionStatus}</td>
          </tr>
          <tr>
            <th>Transaction Message: </th>
            <td>{vnp_TransactionMessage}</td>
          </tr>
        </tbody>
      </table> */}

      <div className="flex-center">
        <Link
          to="/orders"
          className="btn cta bold-font large-font uppercase-text hover-w-fade"
        >
          Track Order
        </Link>
        <Link
          to="/shop"
          className="btn ml-20 bold-font large-font uppercase-text hover-w-fade"
        >
          Shop
        </Link>
      </div>
    </StyledOrderSuccessInform>
  );
}

export default OrderSuccessInform;
