import React, { useContext, useEffect, useState } from "react";
import { TailSpin } from "react-loader-spinner";

import { QuestionMessage } from "../Cart/BagFavorites";
import StyledFavorites from "./StyledFavorites";
import FavoriteItems from "./FavoriteItems";
import EditButton from "./EditButton";

// Redux-related
import { useIsLoggedIn } from "features/user/userSlice";

const EditContext = React.createContext(null);
export const useEditContext = () => useContext(EditContext);

function Favorites() {
  const isLoggedIn = useIsLoggedIn();
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState(false);
  const [uncheckedItems, setUncheckedItems] = useState([]);

  const handleToggleEditing = () => {
    setEditing((prev) => !prev);
  };
  const handleEditing = (item, status) => {
    switch (status) {
      case "check":
        setUncheckedItems((prev) => {
          let newItems = [...prev];
          newItems = newItems.filter(
            (i) =>
              i.product_id !== item.product_id &&
              i.added.colorId !== item.added.colorId
          );

          return newItems;
        });
        break;
      case "uncheck":
        setUncheckedItems((prev) => {
          let newItems = [...prev];
          newItems.push(item);

          return newItems;
        });
        break;
      default:
        throw new Error("Invalid status... (Favorites)");
    }
  };
  const resetUncheckedItems = () => {
    setUncheckedItems([]);
  };

  useEffect(() => {
    const timeID = setTimeout(() => {
      setLoading(false);
    }, 3000);

    return () => clearTimeout(timeID);
  });

  return (
    <EditContext.Provider
      value={{
        editing,
        handleToggleEditing,
        uncheckedItems,
        handleEditing,
        resetUncheckedItems,
      }}
    >
      <StyledFavorites>
        {(!isLoggedIn && (
          <QuestionMessage className="grid-col-span-3 text-center flex-center regular-font" />
        )) ||
          (loading && <Spinner />) || (
            <React.Fragment>
              <EditButton />
              <FavoriteItems />
            </React.Fragment>
          )}
      </StyledFavorites>
    </EditContext.Provider>
  );
}

const Spinner = () => {
  return (
    <div className="spinner grid-col-span-3 flex-center">
      <TailSpin color="#111" width="24" height="24" />
    </div>
  );
};

export default Favorites;
