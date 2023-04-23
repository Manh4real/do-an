require("dotenv").config();

const algoliasearch = require("algoliasearch");

async function saveObjects(records) {
  // Connect and authenticate with your Algolia app
  const client = algoliasearch(
    process.env.ALGOLIA_APP_ID,
    process.env.ALGOLIA_API_KEY
  );

  // Create a new index and add a record
  const index = client.initIndex(process.env.ALGOLIA_INDEX_NAME);
  const result = await index.saveObjects(
    records.map((record) => {
      return {
        ...record,
        objectID: record.product_id,
      };
    })
  );

  return result;
}
module.exports = {
  async saveObjectsToAlgoliaIndex(products) {
    try {
      console.log("Saving to Algolia Index...");
      const result = await saveObjects(products);
      console.log("Algolia: Saved to index", result);
    } catch (err) {
      console.log("Angolia Error: ", err);
    }
  },
  async partialUpdateObject(partialObject = {}) {
    // Connect and authenticate with your Algolia app
    const client = algoliasearch(
      process.env.ALGOLIA_APP_ID,
      process.env.ALGOLIA_API_KEY
    );

    // Create a new index and add a record
    const index = client.initIndex(process.env.ALGOLIA_INDEX_NAME);

    index
      .partialUpdateObject({
        ...partialObject,
        objectID: partialObject.product_id,
      })
      .then(({ objectID }) => {
        console.log(objectID);
      });
  },
  async deleteObjectFromAlgoliaIndex(objectId) {
    // Connect and authenticate with your Algolia app
    const client = algoliasearch(
      process.env.ALGOLIA_APP_ID,
      process.env.ALGOLIA_API_KEY
    );

    // Create a new index and add a record
    const index = client.initIndex(process.env.ALGOLIA_INDEX_NAME);

    index.deleteObject(objectId).then(({ objectIDs }) => {
      console.log(objectIDs);
    });
  },
  async deleteObjectsFromAlgoliaIndex(objectIds) {
    // Connect and authenticate with your Algolia app
    const client = algoliasearch(
      process.env.ALGOLIA_APP_ID,
      process.env.ALGOLIA_API_KEY
    );

    // Create a new index and add a record
    const index = client.initIndex(process.env.ALGOLIA_INDEX_NAME);

    index.deleteObjects(objectIds).then(({ objectIDs }) => {
      console.log(objectIDs);
    });
  },
};
