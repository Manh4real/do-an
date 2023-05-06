import clsx from "clsx";
import React from "react";

function FallbackCheckoutFormSelect({ address, setAddress }) {
  return (
    <>
      <div
        className={clsx(
          "grid-col-span-all checkout__form-input flex-start checkout__block",
          {
            "is--filled": Boolean(address.province),
          }
        )}
      >
        <input
          id="city"
          inputMode="text"
          value={address.province || ""}
          onChange={(e) => {
            setAddress((prev) => ({
              ...prev,
              province: e.target.value,
            }));
          }}
        />
        <label htmlFor="city" className="flex-start gap-5 regular-font">
          City / Province
        </label>
        <svg
          className="check-icon"
          xmlns="http://www.w3.org/2000/svg"
          width="12"
          height="12"
          fill="#6bd079"
          viewBox="0 0 24 24"
        >
          <path d="M20.285 2l-11.285 11.567-5.286-5.011-3.714 3.716 9 8.728 15-15.285z"></path>
        </svg>
        <div className="mask"></div>
      </div>
      <div
        className={clsx("checkout__form-input flex-start checkout__block", {
          "is--filled": Boolean(address.district),
        })}
      >
        <input
          id="district"
          inputMode="text"
          value={address.district || ""}
          onChange={(e) => {
            setAddress((prev) => ({
              ...prev,
              district: e.target.value,
            }));
          }}
        />
        <label htmlFor="district" className="flex-start gap-5 regular-font">
          District
        </label>
        <svg
          className="check-icon"
          xmlns="http://www.w3.org/2000/svg"
          width="12"
          height="12"
          fill="#6bd079"
          viewBox="0 0 24 24"
        >
          <path d="M20.285 2l-11.285 11.567-5.286-5.011-3.714 3.716 9 8.728 15-15.285z"></path>
        </svg>
        <div className="mask"></div>
      </div>
      <div
        className={clsx("checkout__form-input flex-start checkout__block", {
          "is--filled": Boolean(address.ward),
        })}
      >
        <input
          id="ward"
          inputMode="text"
          value={address.ward || ""}
          onChange={(e) => {
            setAddress((prev) => ({
              ...prev,
              ward: e.target.value,
            }));
          }}
        />
        <label htmlFor="ward" className="flex-start gap-5 regular-font">
          Ward
        </label>
        <svg
          className="check-icon"
          xmlns="http://www.w3.org/2000/svg"
          width="12"
          height="12"
          fill="#6bd079"
          viewBox="0 0 24 24"
        >
          <path d="M20.285 2l-11.285 11.567-5.286-5.011-3.714 3.716 9 8.728 15-15.285z"></path>
        </svg>
        <div className="mask"></div>
      </div>
    </>
  );
}

export default FallbackCheckoutFormSelect;
