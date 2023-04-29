import React, { useEffect, useState } from "react";

import StyledOrders from "./StyledOrders";
// import { THREE_DAYS_TIME } from "../../constants";
// import { Link } from "react-router-dom";
import { getMyOrders } from "services/users";
import { useIsLoggedIn } from "features/user/userSlice";
import { stringifyDate } from "script";
import OrderItem from "./OrderItem";
import { RelatedProductsCarousel } from "components/Carousel";
import Spinner from "components/Spinner";
import { Link } from "react-router-dom";
import { formatCurrency } from "helpers";

import HeaderTabs from "./HeaderTabs";

function Orders() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState([]);
  const [activeStatus, setActiveStatus] = useState("");

  const isLoggedIn = useIsLoggedIn();

  useEffect(() => {
    const controller = new AbortController();

    if (isLoggedIn) {
      setLoading(true);
      getMyOrders({ signal: controller.signal })
        .then((orders) => {
          setOrders(orders);
        })
        .finally(() => {
          setLoading(false);
        });
    }

    return () => {
      controller.abort();
    };
  }, [isLoggedIn]);

  if (loading) {
    return (
      <div className="h-100vh flex-center">
        <Spinner />
      </div>
    );
  }

  const filteredOrders = Object.entries(orders)
    .filter(
      ([, orderItems]) =>
        orderItems[0]?.order_status_id === activeStatus.order_status_id
    )
    .sort(([orderId1], [orderId2]) => orderId2 - orderId1);

  return (
    <StyledOrders>
      <header className="title larger-font grid-col-span-all">
        Orders ({Object.keys(orders).length})
        <HeaderTabs
          activeStatus={activeStatus}
          setActiveStatus={setActiveStatus}
        />
      </header>
      {filteredOrders.map(([orderId, orderItems], i) => {
        const orderedDate = orderItems[0].created_at;
        const totalPrice = orderItems.reduce(
          (acc, orderItem) =>
            acc + orderItem.quantity * orderItem.product.price,
          0
        );

        return (
          <React.Fragment key={i}>
            <div className="flex-spbw mt-25 medium-font order-title mt-25 grey-bg">
              <div>
                <span className="grey-font underlined">#{orderId}</span>
                <span className="ml-10">
                  Placed order on {stringifyDate(new Date(orderedDate))}
                </span>
              </div>
              <div>
                <span className="ml-auto bold-font order-total-price">
                  Total Price: VND {formatCurrency(totalPrice)}
                </span>
              </div>
            </div>

            {orderItems.map((orderItem, i) => {
              return <OrderItem key={i} orderItem={orderItem} />;
            })}
          </React.Fragment>
        );
      })}
      {filteredOrders.length === 0 && (
        <div
          className="grid-col-span-all flex-center text-center large-font"
          style={{
            minHeight: "45vh",
            gridColumn: "2 / -2",
          }}
        >
          <p>No orders yet.</p>
        </div>
      )}
      {Object.keys(orders).length === 0 && (
        <div
          className="grid-col-span-all flex-center text-center large-font"
          style={{
            minHeight: "45vh",
            gridColumn: "2 / -2",
          }}
        >
          <p>You don't have any orders.</p>
          <Link to="/shop" className="mt-15 cta medium-button regular-font">
            Shop now
          </Link>
        </div>
      )}
      {Object.keys(orders).length > 0 && (
        <div className="grid-col-span-all mt-50">
          {console.log("???")}
          <RelatedProductsCarousel
            title={"Related Products"}
            objectIDs={Object.entries(orders).map(
              ([_, orderItems]) => orderItems[0].product_id
            )}
          />
        </div>
      )}
    </StyledOrders>
  );
}

export default Orders;
