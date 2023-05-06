// import { CheckIcon } from "components/Icons";
import React, { useEffect, useMemo, useState } from "react";
import clsx from "clsx";
import {
  getDistrictList,
  getProvinceList,
  getWardList,
} from "services/location";
import CheckoutFormInput from "./CheckoutFormInput";
import { SearchIcon } from "components/Icons";
import Spinner from "components/Spinner";
import Select from "./Select";

import StyledCheckoutForm from "./StyledCheckoutForm";
import FallbackCheckoutFormSelect from "./FallbackCheckoutFormSelect";
// import { createProvinces } from "services/misc";

function CheckoutFormSelect({ validate }) {
  const [loading, setLoading] = useState(false);
  const [hasTimeout, setHasTimeout] = useState(false);

  const [data, setData] = useState({
    additional: "",
    provinces: [],
    districts: [],
    wards: [],
  });
  const [address, setAddress] = useState({
    province: null,
    district: null,
    ward: null,
  });

  useEffect(() => {
    validate(address);
  }, [address, validate]);

  useEffect(() => {
    const controller = new AbortController();

    (async () => {
      setLoading(true);

      try {
        const now = Date.now();
        let timeID;

        new Promise((rs) => {
          timeID = setTimeout(() => {
            rs(true);
          }, 4000);
        })
          .then(() => {
            controller.abort();
            setHasTimeout(true);
            console.log(
              "Get provinces timed out. ",
              Math.floor((Date.now() - now) / 1000) + "s"
            );
          })
          .catch((err) => {
            console.log(err);
          });

        if (hasTimeout) {
          return () => {
            controller.abort();
          };
        }

        const provinces = await getProvinceList({ signal: controller.signal });
        const districts = await getDistrictList({ signal: controller.signal });
        const wards = await getWardList({ signal: controller.signal });
        // const provinces = await getProvinces({ signal: controller.signal });
        // const districts = await getDistricts({ signal: controller.signal });
        // const wards = await getWards({ signal: controller.signal });
        // const { provinces, districts, wards } = await getProvinces({
        // signal: controller.signal,
        // });

        clearTimeout(timeID);

        setData((prev) => {
          return {
            ...prev,
            provinces,
            districts,
            wards,
          };
        });
        setAddress((prev) => {
          const province = provinces[0];
          const district = districts.find(({ province_code }) => {
            return province_code === province.code;
          });
          const ward = wards.find(({ district_code }) => {
            return district_code === district.code;
          });

          return {
            ...prev,
            province: {
              value: province.code,
              text: province.name,
            },
            district: {
              value: district.code,
              text: district.name,
            },
            ward: {
              value: ward.code,
              text: ward.name,
            },
          };
        });
      } catch (err) {
        console.log(err);
      } finally {
        setLoading(false);
      }
    })();

    return () => {
      controller.abort();
    };
  }, [hasTimeout]);

  const provincesOptions = useMemo(() => {
    return data.provinces.map(({ name, code }) => ({
      value: code,
      text: name,
    }));
  }, [data.provinces]);

  const districtsOptions = useMemo(() => {
    if (!address.province) return [];

    return data.districts
      .filter((d) => d.province_code === address.province.value)
      .map(({ name, code }) => ({
        value: code,
        text: name,
      }));
  }, [address.province, data.districts]);

  const wardsOptions = useMemo(() => {
    if (!address.district) return [];

    return data.wards
      .filter((d) => d.district_code === address.district.value)
      .map(({ name, code }) => ({
        value: code,
        text: name,
      }));
  }, [address.district, data.wards]);

  return (
    <StyledCheckoutForm
      className="grid-col-span-all"
      style={{
        display: "grid",
        gridTemplateColumns: "repeat(2, 1fr)",
        gap: "15px",
      }}
    >
      {loading && <Spinner />}

      {!loading && !hasTimeout && (
        <React.Fragment>
          <Select
            className={clsx(
              "checkout__form-input",
              "flex-start",
              "checkout__block input",
              "grid-col-span-all"
            )}
            selected={address.province}
            options={provincesOptions}
            handleChange={(province) => {
              setAddress((prev) => {
                const district = data.districts.find(({ province_code }) => {
                  return province_code === province.value;
                });

                const ward = data.wards.find(({ district_code }) => {
                  return district_code === district.code;
                });

                return {
                  ...prev,
                  province,
                  district: {
                    value: district?.code || districtsOptions[0]?.value,
                    text: district?.name || districtsOptions[0]?.text,
                  },
                  ward: {
                    value: ward?.code || wardsOptions[0]?.value,
                    text: ward?.name || wardsOptions[0]?.text,
                  },
                };
              });
            }}
          ></Select>
          <Select
            className={clsx(
              "checkout__form-input",
              "flex-start",
              "checkout__block input"
            )}
            selected={address.district}
            options={districtsOptions}
            handleChange={(district) => {
              setAddress((prev) => {
                const ward = data.wards.find(({ district_code }) => {
                  return district_code === district.value;
                });

                return {
                  ...prev,
                  district,
                  ward: {
                    value: ward?.code || wardsOptions[0]?.value,
                    text: ward?.name || wardsOptions[0]?.text,
                  },
                };
              });
            }}
          ></Select>
          <Select
            className={clsx("checkout__block input")}
            selected={address.ward}
            options={wardsOptions}
            handleChange={(ward) => {
              setAddress((prev) => {
                return {
                  ...prev,
                  ward,
                };
              });
            }}
          ></Select>
        </React.Fragment>
      )}
      {hasTimeout && (
        <FallbackCheckoutFormSelect address={address} setAddress={setAddress} />
      )}
      <CheckoutFormInput
        className="grid-col-span-2"
        validate={(additional) => {
          validate({
            ...address,
            additional,
          });
        }}
      >
        <SearchIcon w="14" h="14" fill="var(--grey)" />
        Start typing the first line of your address
      </CheckoutFormInput>
    </StyledCheckoutForm>
  );
}

export default CheckoutFormSelect;
