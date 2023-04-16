import React from "react";

import PFCarousel from "./PFCarousel";

function ProfileFavorites() {
  return (
    <div className="profile__favorites">
      <header className="title flex-start gap-25">
        <span className="font-24">Favorite</span>
        <span className="grey-font">|</span>
        <a
          href="/favorites"
          className="small-font capitalized-text hover-w-fade"
        >
          View all
        </a>
      </header>
      <PFCarousel />
    </div>
  );
}

export default ProfileFavorites;
