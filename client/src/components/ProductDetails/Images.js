import React, { useEffect, useState } from "react";
import clsx from "clsx";

import { ShownImageModal } from "./ShownImageModal";

// import { getImagesByProductID } from "services/images";

/*
  images: {
    "red": [...],
    "blue": [...],
    ...
    cover: "..."
  }
*/

function Images({ images, product_id, selectedColor }) {
  // const [images, setImages] = useState([]);

  // useEffect(() => {
  //   getImagesByProductID(product_id).then(data => {
  //     setImages(data.data.images);
  //   })
  // }, [product_id]);
  // console.log(images);
  return (
    <>
      <div className="card">
        <svg height="20px" width="20px" fill="#111" viewBox="0 0 25 32">
          <path d="M12.48 4l-3.04 8.96-9.44.32 7.6 5.6L4.96 28l7.68-5.44 7.84 5.28-2.8-9.04 7.52-5.76-9.52-.08z"></path>
        </svg>
        <span>Highly rated</span>
      </div>
      <div className="images-ctn">
        {Object.keys(images).map((key, index) => {
          return (
            <Image
              className={
                Object.keys(images).length > 1 ? "" : "grid-col-span-2"
              }
              key={index}
              src={images[key].url}
            />
          );
        })}
      </div>
    </>
  );
}

const Image = ({ className, src }) => {
  const [show, setShow] = useState(false);

  useEffect(() => {
    document.querySelector("body").style.overflow = show ? "hidden" : "initial";
  }, [show]);

  const handleOpen = () => {
    setShow(true);
  };
  const handleClose = (e) => {
    e.stopPropagation();
    setShow(false);
  };

  return (
    <div className={clsx("detail-image", className)} onClick={handleOpen}>
      <img src={src} alt="" />
      {show && (
        <ShownImageModal shown={show} src={src} handleClose={handleClose} />
      )}
    </div>
  );
};

export default Images;
