import React from "react";

import styles from "./Product.module.css";

function ProductImages({ images, handleImageChange }) {
  //  style={isHovered? {}: { display: "none" }}
  return (
    <div className={styles["changable-images"]}>
      {Object.values(images).map((image, i) => (
        <Img key={i} src={image} onClick={() => handleImageChange(image)} />
      ))}
    </div>
  );
}

const Img = (props) => {
  return <img {...props} width="40" alt="" />;
};

export default ProductImages;
