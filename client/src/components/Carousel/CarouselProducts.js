import React from "react";

import { useDownloadImage } from "hooks";

const CarouselProducts = React.forwardRef((products, ref) => {
  return (
    <div ref={ref} className="carousel" id="carousel">
      {products.map((p, i) => {
        return <CarouselProduct key={i} item={p} />;
      })}
    </div>
  );
});

export const CarouselProduct = ({ item: p }) => {
  const colorId = Object.keys(p.images)[0]; // first color
  const imageName = colorId && p.images[colorId][0].url; // first image of that color

  const { url } = useDownloadImage(imageName);

  return (
    <div className="product-container">
      <div className="pd-cover">
        <a href={`/products/${p.product_id}/${colorId}`}>
          <div className="pd-cover">
            {url ? (
              <img src={url} alt={p.product_name} />
            ) : (
              <SimpleImageSkeleton />
            )}
          </div>
          <div className="pd-title-i regular-font">
            <div className="pd-name flex-spbw flex-wrap capitalized-text">
              {p.product_name}
              <div className="price">${p.price}</div>
            </div>
            <div className="pd-type">{p.target}</div>
            <div className="pd-type regular-font mt-15">{p.brand_name}</div>
          </div>
        </a>
      </div>
    </div>
  );
};

const SimpleImageSkeleton = () => {
  return <div style={{ height: 472, width: 465 }}></div>;
};

// const CAROUSEL_PRODUCTS = [
//   {
//     id: 1,
//     target: "Men's Shoes",
//     images: {
//       1: [{ url: "10.jfif" }],
//     },
//     price: 200,
//     product_name: "",
//   },
//   {
//     id: 2,
//     target: "Men's Shoes",
//     images: {
//       1: [{ url: "11.jfif" }],
//     },
//     price: 200,
//     product_name: "",
//   },
//   {
//     id: 3,
//     target: "Men's Shoes",
//     images: {
//       1: [{ url: "12.jfif" }],
//     },
//     price: 200,
//     product_name: "",
//   },
//   {
//     id: 5,
//     target: "Men's Shoes",
//     images: {
//       1: [{ url: "13.jfif" }],
//     },
//     price: 200,
//     product_name: "",
//   },
// ];

export default React.memo(CarouselProducts);
