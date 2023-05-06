import React from "react";

import PFCarousel from "./PFCarousel";
import { Link } from "react-router-dom";

function ProfileFavorites() {
  return (
    <div className="profile__favorites">
      <header className="title flex-start gap-25">
        <span className="font-24">Favorite</span>
        <span className="grey-font">|</span>
        <Link
          to="/favorites"
          className="small-font capitalized-text hover-w-fade"
        >
          View all
        </Link>
      </header>
      <PFCarousel />
    </div>
  );
}

export default ProfileFavorites;
