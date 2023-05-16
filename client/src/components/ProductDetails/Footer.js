import React, { useEffect, useState } from "react";
import { TailSpin } from "react-loader-spinner";

import RelatedProductsCarousel from "../Carousel/RelatedProductsCarousel";
import StyledFooter from "./StyledFooter";
import BoughtTogetherProductsCarousel from "components/Carousel/BoughtTogetherProductsCarousel";

function Footer({ currentproductID }) {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const timeID = setTimeout(() => setLoading(false), 1000);

    return () => clearTimeout(timeID);
  }, []);

  return (
    <StyledFooter>
      {loading ? (
        <TailSpin color="#111" height={32} width={32} ariaLabel="loading" />
      ) : (
        <>
          <BoughtTogetherProductsCarousel
            title="Frequently Bought Together"
            objectIDs={[currentproductID]}
          />
          <RelatedProductsCarousel
            title="You Might Also Like"
            objectIDs={[currentproductID]}
          />
        </>
      )}
    </StyledFooter>
  );
}

export default React.memo(Footer);
