import React, { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";

import { payment } from "api";

import Spinner from "components/Spinner";
import { useDispatch } from "react-redux";
import { clearBag } from "features/bag/bagSlice";

function OrderResult() {
  const [searchParams] = useSearchParams();
  const [result, setResult] = useState();

  useEffect(() => {
    const vnp_Amount = searchParams.get("vnp_Amount");
    const vnp_BankCode = searchParams.get("vnp_BankCode");
    const vnp_BankTranNo = searchParams.get("vnp_BankTranNo");
    const vnp_CardType = searchParams.get("vnp_CardType");
    const vnp_OrderInfo = searchParams.get("vnp_OrderInfo");
    const vnp_PayDate = searchParams.get("vnp_PayDate");
    const vnp_ResponseCode = searchParams.get("vnp_ResponseCode");
    const vnp_TmnCode = searchParams.get("vnp_TmnCode");
    const vnp_TransactionNo = searchParams.get("vnp_TransactionNo");
    const vnp_TxnRef = searchParams.get("vnp_TxnRef");
    const vnp_TransactionStatus = searchParams.get("vnp_TransactionStatus");
    const vnp_SecureHashType = searchParams.get("vnp_SecureHashType");
    const vnp_SecureHash = searchParams.get("vnp_SecureHash");

    payment
      .get("/vnp/vnpay_ipn", {
        params: {
          vnp_Amount,
          vnp_BankCode,
          vnp_BankTranNo,
          vnp_CardType,
          vnp_OrderInfo,
          vnp_PayDate,
          vnp_ResponseCode,
          vnp_TmnCode,
          vnp_TransactionNo,
          vnp_TransactionStatus,
          vnp_TxnRef,
          vnp_SecureHashType,
          vnp_SecureHash,
        },
      })
      .then((data) => {
        setResult(data.data);
      });
  }, [searchParams]);

  const dispatch = useDispatch();
  const navigate = useNavigate();

  useEffect(() => {
    if (result?.RspCode === "00") {
      dispatch(clearBag());
      navigate("/place-order-success", {
        replace: true,
        state: { placeOrderSuccess: true },
      });
    }
  }, [result, dispatch, navigate]);

  return result ? JSON.stringify(result) : <Spinner />;
}

export default OrderResult;
