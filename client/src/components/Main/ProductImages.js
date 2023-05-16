import React from "react";

import styles from "./Product.module.css";
import clsx from "clsx";

function ProductImages({ activeImage, images, handleImageChange }) {
  return (
    <div className={styles["changable-images"]}>
      {Object.values(images).map((image, i) => (
        <Img
          key={i}
          src={image}
          className={clsx({
            [styles.active]: activeImage === image,
          })}
          onClick={() => handleImageChange(image)}
        />
      ))}
    </div>
  );
}

const Img = (props) => {
  return <img {...props} width="40" alt="" />;
};

export default ProductImages;
