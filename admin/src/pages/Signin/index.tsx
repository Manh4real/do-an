import React, { useState, useRef } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";

import { Logo } from "../../Icons";

import { signIn } from "../../services/users";

import { useUserStore } from "../../store/user";

function Signin() {
  const [processing, setProcessing] = useState(false);

  const emailRef = useRef<HTMLInputElement>(null);
  const passRef = useRef<HTMLInputElement>(null);

  const userStore = useUserStore();
  const navigate = useNavigate();
  const location = useLocation();

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (!emailRef.current || !passRef.current) return;

    const email = emailRef.current.value;
    const password = passRef.current.value;

    setProcessing(true);

    signIn({ email, password })
      .then((data) => {
        const user = data.user;

        if (user) {
          userStore.setUser(user);

          navigate(location.state?.from?.pathname || "/", { replace: true });
        }

        if (data.status === "error") {
          alert(data.error);
        }
      })
      .catch((err) => {
        alert(err.response.data.message);
      })
      .finally(() => {
        setProcessing(false);
      });
  };

  // if (userStore.data) return <Navigate to="/" />;

  return (
    <div className="flex min-h-full items-center justify-center px-4 py-12 sm:px-6 lg:px-8">
      <div className="w-full max-w-md space-y-8">
        <div>
          <div className="w-max mx-auto">
            <Logo />
          </div>
          <h2 className="mt-6 text-center text-3xl font-bold tracking-tight text-gray-900">
            <span className="text-indigo-600">Sign in</span> to access your
            admin or manager account
          </h2>
          {/* <p className="mt-2 text-center text-sm text-gray-600">
            Or don't have an account?
            <a
              href="/"
              className="font-medium text-indigo-600 hover:text-indigo-500 ml-1"
            >
              Create account
            </a>
          </p> */}
        </div>
        <form
          onSubmit={handleSubmit}
          className="mt-8 space-y-6"
          action="#"
          method="POST"
        >
          <input type="hidden" name="remember" value="true" />
          <div className="-space-y-px rounded-md shadow-sm">
            <div>
              <label htmlFor="email-address" className="sr-only">
                Email address
              </label>
              <input
                ref={emailRef}
                id="email-address"
                name="email"
                type="email"
                autoComplete="email"
                required
                className="relative block w-full rounded-t-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 p-2"
                placeholder="Email address"
              />
            </div>
            <div>
              <label htmlFor="password" className="sr-only">
                Password
              </label>
              <input
                ref={passRef}
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                className="relative block w-full rounded-b-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 p-2"
                placeholder="Password"
              />
            </div>
          </div>

          <div className="flex items-center justify-between">
            <div className="flex items-center">
              <input
                id="remember-me"
                name="remember-me"
                type="checkbox"
                className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600"
              />
              <label
                htmlFor="remember-me"
                className="ml-2 block text-sm text-gray-900"
              >
                Remember me
              </label>
            </div>

            <div className="text-sm">
              <Link
                to="/"
                className="font-medium text-indigo-600 hover:text-indigo-500"
              >
                Forgot your password?
              </Link>
            </div>
          </div>

          <div>
            <button
              type="submit"
              className="group relative flex w-full justify-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              <span className="absolute inset-y-0 left-0 flex items-center pl-3">
                <svg
                  className="h-5 w-5 text-indigo-500 group-hover:text-indigo-400"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                  aria-hidden="true"
                >
                  <path
                    fillRule="evenodd"
                    d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z"
                    clipRule="evenodd"
                  />
                </svg>
              </span>
              {processing ? "Processing..." : "Sign in"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default Signin;
