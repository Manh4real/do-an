import {
  PaymentElement,
  useElements,
  useStripe,
} from "@stripe/react-stripe-js";
import { Elements } from "@stripe/react-stripe-js";
import { loadStripe } from "@stripe/stripe-js";
import { useEffect, useState } from "react";
import { createPaymentIntent } from "services/payment";
import StyledStripePayment from "./StyledStripePayment";

// Make sure to call `loadStripe` outside of a component’s render to avoid
// recreating the `Stripe` object on every render.
const stripePromise = loadStripe(
  "pk_test_51N2rtKCUuUZ7cLz9SVcFHtLro4hMLcBl6gF8vpucqzcFGTfrfuU3y0Vp80gqyXJKnyoD2IOQWbAQmCaW6Ve3BYbN00vBwMJptA"
);

export default function StripePayment({ items, ...props }) {
  const [clientSecret, setClientSecret] = useState("");

  useEffect(() => {
    createPaymentIntent(
      items.products.map((p) => ({ product_id: p.product_id, added: p.added }))
    ).then((clientSecret) => {
      setClientSecret(clientSecret);
    });
  }, [items.products]);

  const options = {
    appearance: { theme: "stripe" },
    // passing the client secret obtained from the server
    clientSecret: clientSecret,
  };

  return (
    <StyledStripePayment>
      {clientSecret && (
        <Elements stripe={stripePromise} options={options}>
          <CheckoutForm clientSecret={clientSecret} {...props} />
        </Elements>
      )}
    </StyledStripePayment>
  );
}

const CheckoutForm = ({ handleNextStep, userEmail }) => {
  const stripe = useStripe();
  const elements = useElements();

  const [errorMessage, setErrorMessage] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  // const location = useLocation();

  const handleSubmit = async (event) => {
    // We don't want to let default form submission happen here,
    // which would refresh the page.
    event.preventDefault();

    if (!stripe || !elements) {
      // Stripe.js has not yet loaded.
      // Make sure to disable form submission until Stripe.js has loaded.
      return;
    }

    setIsLoading(true);

    const { error, paymentIntent } = await stripe.confirmPayment({
      //`Elements` instance that was used to create the Payment Element
      elements,
      confirmParams: {
        receipt_email: userEmail,
        // return_url: location.pathname,
      },
      redirect: "if_required",
    });
    if (error) {
      // This point will only be reached if there is an immediate error when
      // confirming the payment. Show error to your customer (for example, payment
      // details incomplete)
      let msg = "";

      if (error.payment_intent) {
        msg =
          "Payment has been previously confirmed. And " +
          checkStatus(error.payment_intent.status);
      }
      setErrorMessage(msg || error.message || "An unexpected error occurred.");
    } else {
      // Your customer will be redirected to your `return_url`. For some payment
      // methods like iDEAL, your customer will be redirected to an intermediate
      // site first to authorize the payment, then redirected to the `return_url`.
    }

    if (paymentIntent) {
      console.log(checkStatus(paymentIntent.status));

      if (paymentIntent.status === "succeeded") {
        handleNextStep(paymentIntent.status);
        setErrorMessage("");
      }
    }

    setIsLoading(false);
  };

  return (
    <form onSubmit={handleSubmit}>
      <PaymentElement />
      <button disabled={isLoading || !stripe || !elements}>
        <span className="white-font">
          {isLoading ? <div className="spinner" id="spinner"></div> : "Submit"}
        </span>
      </button>
      {/* Show error message to your customers */}
      {errorMessage && (
        <div className="red-font regular-font mt-15 mb-10">{errorMessage}</div>
      )}
    </form>
  );
};

const checkStatus = (status) => {
  switch (status) {
    case "succeeded":
      return "Payment has succeeded!";
    case "processing":
      return "Your payment is processing.";
    case "requires_payment_method":
      return "Your payment was not successful, please try again.";
    default:
      return "Payment: Something went wrong.";
  }
};
