import React, { useEffect, useMemo, useState } from "react";
import clsx from "clsx";

import { LocationArrowIcon } from "components/Icons";
import { Validation } from "script";
import { PICKUP } from "../../../constants";
import { getUserGeolocation } from "services/location";

import { useCheckoutStepContext } from "../Steps";

// Redux
import { updateDeliveryInfo } from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";
import { countryFromCountryCode } from "helpers";

function PickupMethod({ handleDone, nextStep }) {
  const dispatch = useDispatch();

  const { setStep } = useCheckoutStepContext();

  const [code, setCode] = useState("");
  const [first, setFirst] = useState(true);
  const [exist, setExist] = useState({ yes: true, info: null });

  const validation = useMemo(() => {
    return new Validation(PICKUP);
  }, []);

  const handleChange = (e) => {
    setCode(e.target.value);
    setFirst(false);
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Postal code: ", validation.getAll());

    if (validation.isAllValid()) {
      getUserGeolocation(code)
        .then((data) => {
          console.log(data);

          const zipcode = data.zipcode_data?.results;
          if (zipcode && Array.isArray(zipcode) && zipcode.length === 0) {
            setExist({ yes: false, info: null });
          } else if (typeof zipcode === "object" && !zipcode[code]) {
            setExist({ yes: false, info: null });
          } else if (typeof zipcode === "object" && zipcode[code]) {
            // single zipcode (JUST USING THIS TYPE OF DATA)
            setExist({ yes: true, info: zipcode[code] });
            setStep(nextStep);
            handleDone();

            // update checkout info (Redux)
            dispatch(updateDeliveryInfo(data));
          } else if (zipcode && Array.isArray(zipcode) && zipcode.length > 0) {
            // multiple zipcodes (DON'T USE THIS TYPE)
            setExist({ yes: true, info: zipcode });
            setStep(nextStep);
            handleDone();
          } else {
            setExist({ yes: false, info: null });
          }
        })
        .catch((error) => {
          console.log({ error });
          setExist({ yes: false, info: null });
        });
    }
  };
  const handleFindingStore = () => {
    alert("Finding stores...");
  };

  const c = !first && validation.validatePostal(code);

  const userLocation = useMemo(() => {
    if (!exist.info) return "";

    const country = countryFromCountryCode(exist.info[0].country_code);

    return [
      exist.info[0].state,
      exist.info[0].province || "",
      exist.info[0].city_en,
      country,
    ]
      .filter((value) => value)
      .join(", ");
  }, [exist]);

  return (
    <form
      className="checkout__form checkout__form-grid checkout__step-pickup-form"
      onSubmit={handleSubmit}
    >
      <div className="title row grid-col-span-2">
        SELECT A STORE LOCATION IN <UserCountry />
      </div>
      <div
        className={clsx("checkout__form-input postal-code-input", {
          "is--error": !exist.yes || Boolean(c),
        })}
      >
        <input
          className="checkout__block"
          value={code}
          onChange={handleChange}
          placeholder="Postal Code"
        />
        <button
          title="Find Stores Near You"
          type="button"
          onClick={handleFindingStore}
          className="location-btn flex-center"
        >
          <LocationArrowIcon w="14" h="14" fill="var(--darker-grey)" />
        </button>
        {!exist.yes || c}
      </div>
      <button type="submit" className="apply-btn">
        <span className="underlined">Apply</span>
      </button>
      {!exist.yes && (
        <p className="small-font red-font" style={{ marginTop: -10 }}>
          Please enter correct code.
        </p>
      )}
      <div className="grid-col-span-2 row message">
        {exist.yes && exist.info ? (
          <p>
            <LocationPoint width={16} height={16} />
            &nbsp;&nbsp;
            {userLocation}
          </p>
        ) : (
          "Enter your zip code to find a pickup location near you."
        )}
      </div>
    </form>
  );
}

const UserCountry = () => {
  const [country, setCountry] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getUserGeolocation(null, { signal: controller.signal })
      .then((data) => {
        const countryName = countryFromCountryCode(data.geolocation.country);
        setCountry(countryName);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, []);

  return country;
};

const LocationPoint = ({ width = 24, height = 24 }) => {
  return (
    <svg
      width={width}
      height={height}
      xmlns="http://www.w3.org/2000/svg"
      fillRule="evenodd"
      clipRule="evenodd"
      viewBox="0 0 24 24"
    >
      <path d="M12 10c-1.104 0-2-.896-2-2s.896-2 2-2 2 .896 2 2-.896 2-2 2m0-5c-1.657 0-3 1.343-3 3s1.343 3 3 3 3-1.343 3-3-1.343-3-3-3m-7 2.602c0-3.517 3.271-6.602 7-6.602s7 3.085 7 6.602c0 3.455-2.563 7.543-7 14.527-4.489-7.073-7-11.072-7-14.527m7-7.602c-4.198 0-8 3.403-8 7.602 0 4.198 3.469 9.21 8 16.398 4.531-7.188 8-12.2 8-16.398 0-4.199-3.801-7.602-8-7.602" />
    </svg>
  );
};

export default PickupMethod;
