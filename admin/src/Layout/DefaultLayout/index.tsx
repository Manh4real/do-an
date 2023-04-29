import React, { useEffect, useState } from "react";
import { Navigate, Outlet, useLocation, useNavigate } from "react-router-dom";

import Header from "../../components/Header";
import Sidebar from "../../components/Sidebar";

import { useUserStore } from "../../store/user";
import { Spinner } from "../../Icons";

type IStatus = "idle" | "pending" | "resolved" | "error";

function DefaultLayout() {
  const [status, setStatus] = useState<IStatus>("idle");
  const userStore = useUserStore();

  const navigate = useNavigate();
  const location = useLocation();

  location.state = {
    from: location,
  };

  useEffect(() => {
    if (!userStore.data) {
      setStatus("pending");
      userStore
        .fetchUser()
        .then((ok) => {
          if (ok) navigate(location.state?.from?.pathname || "/");
        })
        .finally(() => {
          setStatus("resolved");
        });
    }
  }, [userStore, navigate, location.state?.from?.pathname]);

  if (!userStore.data && status === "idle") return <></>;

  if (!userStore.data && status === "pending")
    return (
      <div className="min-h-screen min-w-full grid place-items-center">
        <button
          type="button"
          className="rounded disabled:cursor-not-allowed font-medium flex items-center py-3 px-5 bg-indigo-600 text-white"
          disabled
        >
          <Spinner className="animate-spin h-5 w-5 mr-3" />
          Processing
        </button>
      </div>
    );

  if (!userStore.data && status === "resolved")
    return <Navigate to="/sign-in" state={{ from: location }} replace={true} />;

  return (
    <div className="grid gap-4 grid-cols-12 grid-rows-1 min-h-screen">
      <div className="col-span-2">
        <Sidebar />
      </div>
      <div className="col-span-10">
        <Header />
        <Outlet />
      </div>
    </div>
  );
}

export default DefaultLayout;
