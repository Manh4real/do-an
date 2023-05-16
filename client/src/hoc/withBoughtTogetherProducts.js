import React from "react";

import { useFrequentlyBoughtTogether } from "@algolia/recommend-react";
// import { HorizontalSlider } from '@algolia/ui-components-horizontal-slider-react';
import algoliarecommend from "@algolia/recommend";

const withBoughtTogetherProducts = (Component, container) => {
  const recommendClient = algoliarecommend(
    process.env.REACT_APP_ALGOLIA_APP_ID,
    process.env.REACT_APP_ALGOLIA_API_KEY
  );
  const indexName = process.env.REACT_APP_ALGOLIA_INDEX_NAME;

  const WrappedComponent = ({ objectIDs, classNames }) => {
    const { recommendations } = useFrequentlyBoughtTogether({
      recommendClient,
      indexName,
      objectIDs: objectIDs,
      maxRecommendations: 5,
    });

    return (
      <React.Fragment>
        {recommendations.length === 0 ? (
          <Message />
        ) : (
          recommendations.map((recommendation) => {
            return (
              <Component
                key={recommendation.product_id}
                item={recommendation}
              />
            );
          })
        )}
      </React.Fragment>
    );
  };

  WrappedComponent.displayName =
    Component.displayName || Component.name + "withBoughtTogetherProducts";

  return WrappedComponent;
};

const Message = () => <p>Nothing here...</p>;
// const Empty = () => <></>;

export default withBoughtTogetherProducts;
