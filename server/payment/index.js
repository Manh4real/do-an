const express = require("express");

const morgan = require("morgan");
const cors = require("cors");
const fetch = require("node-fetch");

const app = express();

app.use(morgan("dev"));
app.use(cors());
app.use(express.json());

// This is your test secret API key.
const stripe = require("stripe")(
  "sk_test_51N2rtKCUuUZ7cLz9yRORa9c1GPKJbib2Kbp1tjviwDOK3uyOvQDxKjtV3gNXsrRoh3oXyOdskgABN2KuGVUyEgPS00QKADuPJV"
);

app.use(express.static("public"));
app.use(express.json());

const VND_TO_USD = 0.000043;
const USD_TO_CENT = 100;
const calculateOrderAmount = async (items) => {
  const products_ids = items.map((p) => p.product_id);

  if (products_ids.length === 0) return 1;
  const searchParams = new URLSearchParams([["q", products_ids.join(",")]]);
  const response = await fetch(
    "http://localhost:3005/api/v1/products/ids?" + searchParams.toString()
  );
  const data = await response.json();
  // Replace this constant with a calculation of the order's amount
  // Calculate the order total on the server to prevent
  // people from directly manipulating the amount on the client
  return (
    data?.data?.products?.reduce(
      (acc, item) =>
        acc +
        item.price *
          items.find((p) => p.product_id === item.product_id).added.quantity,
      0
    ) || 1
  );
};

app.post("/payment/create-payment-intent", async (req, res) => {
  try {
    const { items } = req.body;

    const amount = await calculateOrderAmount(items);
    const shipping = 1.5 * USD_TO_CENT;
    // Create a PaymentIntent with the order amount and currency
    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.ceil(amount * VND_TO_USD * USD_TO_CENT) + shipping,
      currency: "usd",
      automatic_payment_methods: {
        enabled: true,
      },
    });

    res.status(200).json({
      status: "success",
      data: {
        clientSecret: paymentIntent.client_secret,
      },
    });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});

app.listen(4242, () => console.log("Payment server listening on port 4242!"));
