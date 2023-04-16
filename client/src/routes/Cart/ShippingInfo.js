import React, { useEffect, useState } from "react";
import { stringifyDate } from "script";
import { getUserGeolocation } from "services/location";

import { THREE_DAYS_TIME } from "../../constants";

const ShippingInfo = () => {
  const [date, setDate] = useState("");

  const [postalCode, setPostalCode] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getUserGeolocation(null, { signal: controller.signal })
      .then((data) => {
        setPostalCode(data.geolocation.postal);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, []);

  useEffect(() => {
    const date = new Date(Date.now() + THREE_DAYS_TIME);
    const r = stringifyDate(date);
    const timeID = setTimeout(() => setDate(r), 2000);

    return () => clearTimeout(timeID);
  }, []);

  return (
    <div className="regular-font">
      <h4>Shipping</h4>
      <p>
        Arrives by {date} to&nbsp;
        <button className="underlined regular-font hover-w-hl-udl">
          {postalCode}
        </button>
      </p>
    </div>
  );
};

export default ShippingInfo;
