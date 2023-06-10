import React, { useEffect, useState } from "react";

import StyledOrders from "./StyledOrders";
// import { THREE_DAYS_TIME } from "../../constants";
// import { Link } from "react-router-dom";
import { getMyOrders } from "services/users";
import { useIsLoggedIn } from "features/user/userSlice";
import { RelatedProductsCarousel } from "components/Carousel";
import Spinner from "components/Spinner";
import { Link } from "react-router-dom";

import HeaderTabs from "./HeaderTabs";
import OrderItems from "./OrderItems";
import { RefreshContext } from "./context";

function Orders() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState([]);
  const [activeStatus, setActiveStatus] = useState(null);
  const [refresh, setRefresh] = useState(false);

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
  }, [isLoggedIn, refresh]);

  const handleRefresh = (refresh) => {
    setRefresh(refresh);
  };

  const filteredOrders = Object.entries(orders)
    .filter(
      ([, orderItems]) =>
        orderItems[0]?.order_status_id === activeStatus?.order_status_id
    )
    .sort(([orderId1], [orderId2]) => orderId2 - orderId1);

  return (
    <RefreshContext.Provider value={{ handleRefresh }}>
      <StyledOrders>
        <header className="title larger-font grid-col-span-all">
          Orders ({Object.keys(orders).length})
          <HeaderTabs
            activeStatus={activeStatus}
            setActiveStatus={setActiveStatus}
          />
        </header>
        {loading && (
          <div className="flex-center">
            <Spinner />
          </div>
        )}
        {!loading &&
          filteredOrders.length > 0 &&
          filteredOrders.map(([orderId, orderItems], i) => {
            return (
              <OrderItems key={i} orderId={orderId} orderItems={orderItems} />
            );
          })}
        {!loading && filteredOrders.length === 0 && (
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
            <RelatedProductsCarousel
              title={"Related Products"}
              objectIDs={Object.entries(orders).map(
                ([_, orderItems]) => orderItems[0].product_id
              )}
            />
          </div>
        )}
      </StyledOrders>
    </RefreshContext.Provider>
  );
}

export default Orders;
