import React, { useMemo } from "react";
import { Link, useLocation } from "react-router-dom";

import { stringifyDate } from "script";

import StyledAccount from "./StyledAccount";
import MBCarousel from "./MBCarousel";
import ProfileFavorites from "./ProfileFavorites";
import AccountAvatar from "./AccountAvatar/AccountAvatar";

// Redux-related
import {
  selectUser,
  useIsLoggedIn,
  useUserStatusLoading,
} from "features/user/userSlice";
import { useSelector } from "react-redux";
import Spinner from "components/Spinner";
import EditProfile from "./EditProfile";

function Account() {
  const isLoggedIn = useIsLoggedIn();
  const isUserStatusLoading = useUserStatusLoading();

  return (
    <StyledAccount>
      {isUserStatusLoading ? (
        <Spinner className="spinner" />
      ) : (
        (isLoggedIn && <AccountPageContent />) || <Mes />
      )}
    </StyledAccount>
  );
}

const AccountPageContent = () => {
  const user = useSelector(selectUser);
  const isUserStatusLoading = useUserStatusLoading();

  const { dateString } = useMemo(() => {
    const { registration_time: timestamp } = user;
    const date = timestamp
      ? stringifyDate(new Date(timestamp), false, true)
      : "a time ago";

    return {
      dateString: date,
    };
  }, [user]);

  if (isUserStatusLoading) return <Spinner />;

  return (
    <section className="profile__container">
      <div className="profile__header flex-start gap-25">
        <AccountAvatar url={user.avatar} />
        <div>
          <div className="profile__user-fullName larger-font">
            {user.name.firstName} {user.name.lastName}
            <EditProfile />
          </div>
          <div className="profile__registration-date capitalized-text grey-font regular-font">
            Member Since {dateString}
          </div>
        </div>
      </div>
      <MBCarousel />
      <ProfileFavorites />
    </section>
  );
};

const Mes = () => {
  const location = useLocation();

  return (
    <p className="text-center">
      <Link
        to="/sign-in"
        state={{ from: location }}
        className="medium-font underlined"
      >
        Sign in
      </Link>
      &nbsp;or&nbsp;
      <Link
        to="/join-us"
        state={{ from: location }}
        className="medium-font underlined"
      >
        Join us
      </Link>
      .
    </p>
  );
};

export default Account;
