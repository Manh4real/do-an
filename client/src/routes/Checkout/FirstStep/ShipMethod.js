import React, { useMemo } from "react";
import { useDispatch } from "react-redux";

import {
  CheckoutFormInput,
  CheckoutFormRadios,
  CheckoutFormSelect,
} from "../CheckoutForm";

import { useCheckoutStepContext } from "../Steps";
import { Validation } from "script";
import { SHIP } from "../../../constants";
import { updateDeliveryInfo } from "features/checkout/checkoutSlice";
import CountryCode from "../CheckoutForm/CountryCode";

function ShipMethod({ handleDone, nextStep }) {
  const dispatch = useDispatch();

  const { setStep } = useCheckoutStepContext();

  const validation = useMemo(() => {
    return new Validation(SHIP);
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    const c = validation.isAllValid();

    console.log(validation.getAll());
    if (!c) {
      alert("Fill in the right format. You know what you doin'.");
      return;
    }
    alert("That's it.");
    setStep(nextStep);
    handleDone();

    // update checkout info (Redux)
    dispatch(updateDeliveryInfo(validation.getAll()));
  };

  return (
    <form className="checkout__form checkout__form-grid checkout__step-ship-form">
      <div className="row grid-col-span-2 flex-start gap-15">
        <CheckoutFormRadios
          name="ship-p"
          els={[
            { id: "home-office", label: "Home/Office" },
            { id: "apo-fpo", label: "APO/FPO" },
          ]}
          validate={validation.validateRadios}
        />
      </div>
      <CheckoutFormInput
        className="checkout__first-name"
        placeholder="First Name"
        validate={validation.validateFirstName}
      />
      <CheckoutFormInput
        className="checkout__last-name"
        placeholder="Last Name"
        validate={validation.validateLastName}
      />
      <CheckoutFormSelect
        type="address"
        validate={validation.validateAddress}
      />
      <CheckoutFormInput
        className="checkout__email"
        placeholder="Email"
        validate={validation.validateEmail}
      />
      <CheckoutFormInput
        prefixElement={CountryCode}
        className="checkout__phone"
        placeholder="Phone Number"
        validate={validation.validatePhone}
        inputmode="numeric"
      />

      <div className="row grid-col-span-2 flex-end">
        <button
          onClick={handleSubmit}
          className="checkout__form-button primary hover-w-fade"
        >
          Save & Continue
        </button>
      </div>
    </form>
  );
}

export default ShipMethod;
