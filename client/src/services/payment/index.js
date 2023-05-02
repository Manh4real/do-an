import { payment } from "../../api";

export const createPaymentIntent = async (
  items = [
    { product_id: 1, total_price: 100000 },
    { product_id: 2, total_price: 200000 },
  ]
) => {
  const response = await payment.post(
    "/create-payment-intent",
    { items },
    {
      headers: { "Content-Type": "application/json" },
    }
  );
  const { clientSecret } = response.data.data;

  return clientSecret;
};
