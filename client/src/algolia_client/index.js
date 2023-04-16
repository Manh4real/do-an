import algoliarecommend from "@algolia/recommend";

export const recommendClient = algoliarecommend(
  process.env.REACT_APP_ALGOLIA_APP_ID,
  process.env.REACT_APP_ALGOLIA_API_KEY
);

const indexName = process.env.REACT_APP_ALGOLIA_INDEX_NAME;
