import React, { useState, useMemo, useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";

import { SIGN_IN, SIGN_UP, REVIEW, PROFILE, Validation } from "script";

// Redux-related
import { useDispatch } from "react-redux";
import { signIn, signUp, updateUser } from "features/user/userSlice";
import { addReview } from "services/users";

const timeIDs = [];

const withSubmit = (Form, current) => {
  return function WithSubmit({ ...otherProps }) {
    WithSubmit.displayName = "WithSubmit(Form)";

    const [first, setFirst] = useState(true);
    const [processing, setProcessing] = useState(false);

    const userDispatch = useDispatch();

    const navigate = useNavigate();
    const location = useLocation();
    console.log("Form location state: ", location.state);

    const validation = useMemo(() => {
      return new Validation(current);
    }, []);

    useEffect(() => {
      timeIDs.forEach((timeID) => clearTimeout(timeID));
    }, []);

    const controller = useMemo(() => {
      return new AbortController();
    }, []);
    useEffect(() => {
      return () => {
        controller.abort();
      };
    }, [controller]);

    const handleSubmit = async (e, options = {}) => {
      e.preventDefault();
      setFirst(false);

      if (validation.isAllValid()) {
        console.log("Valid: ", validation.getAll());

        switch (current) {
          case SIGN_UP:
            // let t1 = setTimeout(() => {
            setProcessing(true);
            userDispatch(signUp(validation.getAll()))
              .unwrap()
              .finally(() => {
                setProcessing(false);
              });
            // }, 2000);
            // timeIDs.push(t1);
            break;

          case SIGN_IN:
            // let t2 = setTimeout(() => {
            setProcessing(true);
            userDispatch(signIn(validation.getAll()))
              .unwrap()
              .finally(() => {
                setProcessing(false);
              });
            // }, 2000);
            // timeIDs.push(t2);
            break;

          case REVIEW:
            // let t3 = setTimeout(() => {
            setProcessing(true);

            // posting review here...
            if (otherProps.productId) {
              addReview(
                {
                  productId: otherProps.productId,
                  ...validation.getAll(),
                },
                { signal: controller.signal }
              )
                .then((response) => {
                  console.log(response);
                  if (response?.error) {
                    alert(response.error);
                  }
                  navigate(0); // reload page
                })
                .finally(() => {
                  setProcessing(false);
                });
            }
            // }, 2000);
            // timeIDs.push(t3);
            break;

          case PROFILE:
            setProcessing(true);
            userDispatch(updateUser(validation.getAll()))
              .unwrap()
              .finally(() => {
                options.onSuccess?.();
                setProcessing(false);
              });

            break;
          default:
            throw new Error("Something went wrong...");
        }

        if (current === SIGN_IN || current === SIGN_UP) {
          let t = setTimeout(() => {
            const c = JSON.parse(localStorage.getItem("accessToken"));
            if (c) {
              navigate(location.state?.from?.pathname || -1, { replace: true });
            }
          }, 3000);

          timeIDs.push(t);
        }
      } else {
        console.log("Invalid: ", validation.getAll());
        setFirst(false);
      }
    };

    return (
      <Form
        {...otherProps}
        processing={processing}
        first={first}
        setFirst={setFirst}
        handleSubmit={handleSubmit}
        validation={validation}
      />
    );
  };
};

export { withSubmit };
