require("dotenv").config();

const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const fetch = require("node-fetch");

const app = express();

app.use(morgan("dev"));
app.use(cors());
app.use(express.json());

// This is your test secret API key.
const stripe = require("stripe")(process.env.STRIPE_TEST_SECRET_API_KEY);

app.use(express.static("public"));

const VND_TO_USD = 0.000043;
const USD_TO_CENT = 100;
const SHIPPING_FEE = 30000;
const calculateOrderAmount = async (items) => {
  const products_ids = items.map((p) => p.product_id);

  if (products_ids.length === 0) return 1;
  const searchParams = new URLSearchParams([["q", products_ids.join(",")]]);
  const response = await fetch(
    process.env.API_URL + "/products/ids?" + searchParams.toString()
  );
  const data = await response.json();
  // Replace this constant with a calculation of the order's amount
  // Calculate the order total on the server to prevent
  // people from directly manipulating the amount on the client
  return (
    (data?.data?.products?.reduce(
      (acc, item) =>
        acc +
        item.price *
          items.find((p) => p.product_id === item.product_id).added.quantity,
      0
    ) || 1) + SHIPPING_FEE
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

app.options("/payment/vnp/create_payment_url/", cors());

app.post(
  "/payment/vnp/create_payment_url/",
  cors(),
  async function (req, res, next) {
    process.env.TZ = "Asia/Ho_Chi_Minh";

    let ipAddr =
      req.headers["x-forwarded-for"] ||
      req.connection.remoteAddress ||
      req.socket.remoteAddress ||
      req.connection.socket.remoteAddress;

    let config = require("config");
    let dateFormat = require("dateformat");

    let tmnCode = config.get("vnp_TmnCode");
    let secretKey = config.get("vnp_HashSecret");
    let vnpUrl = config.get("vnp_Url");
    let returnUrl = config.get("vnp_ReturnUrl");

    let date = new Date();

    let createDate = dateFormat(date, "yyyymmddHHmmss");
    // let orderId = Date.now(); // dateFormat(date, "HHmmss")
    const orderId = req.body.orderId;
    const items = req.body.items;
    const amount = await calculateOrderAmount(items);
    let bankCode = req.body.bankCode;
    // const redirectUrl = req.body.redirectUrl;

    let orderInfo = req.body.orderDescription;
    let orderType = req.body.orderType;
    let locale = req.body.language;
    if (locale === null || locale === "" || locale === undefined) {
      locale = "vn";
    }
    let currCode = "VND";
    let vnp_Params = {};
    vnp_Params["vnp_Version"] = "2.1.0";
    vnp_Params["vnp_Command"] = "pay";
    vnp_Params["vnp_TmnCode"] = tmnCode;
    vnp_Params["vnp_Merchant"] = "YMFCPS2K"; // localhost:3000
    vnp_Params["vnp_Locale"] = locale;
    vnp_Params["vnp_CurrCode"] = currCode;
    vnp_Params["vnp_TxnRef"] = orderId;
    vnp_Params["vnp_OrderInfo"] = orderInfo;
    vnp_Params["vnp_OrderType"] = orderType;
    vnp_Params["vnp_Amount"] = amount * 100;
    vnp_Params["vnp_ReturnUrl"] = returnUrl;
    vnp_Params["vnp_IpAddr"] = ipAddr;
    vnp_Params["vnp_CreateDate"] = createDate;

    if (bankCode !== null && bankCode !== "") {
      vnp_Params["vnp_BankCode"] = bankCode;
    }

    vnp_Params = sortObject(vnp_Params);

    let querystring = require("qs");
    let signData = querystring.stringify(vnp_Params, { encode: false });
    let crypto = require("crypto");
    let hmac = crypto.createHmac("sha512", secretKey);
    let signed = hmac.update(new Buffer(signData, "utf-8")).digest("hex");
    vnp_Params["vnp_SecureHash"] = signed;
    // vnp_Params["redirectUrl"] = redirectUrl;
    vnpUrl += "?" + querystring.stringify(vnp_Params, { encode: false });

    // res.redirect(vnpUrl);

    res.status(200).json({
      status: "success",
      redirect: vnpUrl,
    });
  }
);

app.get("/payment/vnp/vnpay_return", function (req, res, next) {
  let vnp_Params = req.query;

  let secureHash = vnp_Params["vnp_SecureHash"];

  delete vnp_Params["vnp_SecureHash"];
  delete vnp_Params["vnp_SecureHashType"];

  vnp_Params = sortObject(vnp_Params);

  let config = require("config");
  let tmnCode = config.get("vnp_TmnCode");
  let secretKey = config.get("vnp_HashSecret");

  let querystring = require("qs");
  let signData = querystring.stringify(vnp_Params, { encode: false });
  let crypto = require("crypto");
  let hmac = crypto.createHmac("sha512", secretKey);
  let signed = hmac.update(new Buffer(signData, "utf-8")).digest("hex");

  if (secureHash === signed) {
    res.json({
      status: "success",
      data: { code: vnp_Params["vnp_ResponseCode"] },
    });
  } else {
    res.json({
      status: "success",
      data: { code: "97" }, // "Chữ ký không hợp lệ"
    });
    // res.render("success", { code: 97 });
  }
});

app.get("/payment/vnp/vnpay_ipn", async function (req, res, next) {
  let vnp_Params = req.query;
  let secureHash = vnp_Params["vnp_SecureHash"];

  let orderId = vnp_Params["vnp_TxnRef"];
  let rspCode = vnp_Params["vnp_ResponseCode"];

  delete vnp_Params["vnp_SecureHash"];
  delete vnp_Params["vnp_SecureHashType"];

  vnp_Params = sortObject(vnp_Params);
  let config = require("config");
  let secretKey = config.get("vnp_HashSecret");
  let querystring = require("qs");
  let signData = querystring.stringify(vnp_Params, { encode: false });
  let crypto = require("crypto");
  let hmac = crypto.createHmac("sha512", secretKey);
  let signed = hmac.update(new Buffer(signData, "utf-8")).digest("hex");

  const getOrderResult = await fetch(
    process.env.API_URL + "/orders/" + orderId
  );
  const getOrderData = await getOrderResult.json();

  let checkOrderId = !!getOrderData.data?.order; // Mã đơn hàng "giá trị của vnp_TxnRef" VNPAY phản hồi tồn tại trong CSDL của bạn
  let checkAmount =
    getOrderData.data?.order?.[0]?.total_price ===
    vnp_Params["vnp_Amount"] / 100; // Kiểm tra số tiền "giá trị của vnp_Amout/100" trùng khớp với số tiền của đơn hàng trong CSDL của bạn

  let paymentStatus = getOrderData.data?.order?.[0]?.payment_status_id; // Giả sử '0' là trạng thái khởi tạo giao dịch, chưa có IPN. Trạng thái này được lưu khi yêu cầu thanh toán chuyển hướng sang Cổng thanh toán VNPAY tại đầu khởi tạo đơn hàng.
  //let paymentStatus = '1'; // Giả sử '1' là trạng thái thành công bạn cập nhật sau IPN được gọi và trả kết quả về nó
  //let paymentStatus = '2'; // Giả sử '2' là trạng thái thất bại bạn cập nhật sau IPN được gọi và trả kết quả về nó

  if (secureHash === signed) {
    //kiểm tra checksum
    if (checkOrderId) {
      if (checkAmount) {
        if (paymentStatus == "0") {
          //kiểm tra tình trạng giao dịch trước khi cập nhật tình trạng thanh toán
          if (rspCode == "00") {
            //thanh cong
            //paymentStatus = '1'
            // Ở đây cập nhật trạng thái giao dịch thanh toán thành công vào CSDL của bạn
            await fetch(process.env.API_URL + "/update-payment-status", {
              method: "PUT",
              body: JSON.stringify({
                order_id: orderId,
                payment_status_id: "1",
              }),
              headers: {
                "Content-Type": "application/json",
              },
            });

            await fetch(process.env.API_URL + "/update-stocks", {
              method: "POST",
              body: JSON.stringify({
                products: getOrderData.data.order,
              }),
              headers: {
                "Content-Type": "application/json",
              },
            });

            res.status(200).json({ RspCode: "00", Message: "Success" });
          } else {
            //that bai
            //paymentStatus = '2'
            // Ở đây cập nhật trạng thái giao dịch thanh toán thất bại vào CSDL của bạn
            await fetch(process.env.API_URL + "/update-payment-status", {
              method: "PUT",
              body: JSON.stringify({
                order_id: orderId,
                payment_status_id: "2",
              }),
              headers: {
                "Content-Type": "application/json",
              },
            });

            res.status(200).json({ RspCode: "00", Message: "Success" });
          }
        } else {
          res.status(200).json({
            RspCode: "02",
            Message: "This order has been updated to the payment status",
          });
        }
      } else {
        res.status(200).json({ RspCode: "04", Message: "Amount invalid" });
      }
    } else {
      res.status(200).json({ RspCode: "01", Message: "Order not found" });
    }
  } else {
    res.status(200).json({ RspCode: "97", Message: "Checksum failed" });
  }
});

function sortObject(obj) {
  let sorted = {};
  let str = [];
  let key;
  for (key in obj) {
    if (obj.hasOwnProperty(key)) {
      str.push(encodeURIComponent(key));
    }
  }
  str.sort();
  for (key = 0; key < str.length; key++) {
    sorted[str[key]] = encodeURIComponent(obj[str[key]]).replace(/%20/g, "+");
  }
  return sorted;
}

app.listen(4242, () => console.log("Payment server listening on port 4242!"));
