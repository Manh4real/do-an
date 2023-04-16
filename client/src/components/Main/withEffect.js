import { useState } from "react";

export const withEffect = (Product) => {
  return function WithEffect(props) {
    WithEffect.displayName = `WithEffect(${Product.name})`;
    // const [isHovered, setIsHovered] = useState(false);
    const [img, setImg] = useState("");

    // const handleEnter = (ignore, e) => {
    //   console.log({ignore});
    //   setIsHovered(true);
    // };
    // const handleLeave = (ignore, e) => {
    //   console.log({ignore});
    //   setIsHovered(false);
    // };
    const handleImageChange = (src) => {
      setImg(src);
    };

    return (
      <Product
        // isHovered={isHovered}
        // handleEnter={handleEnter}
        // handleLeave={handleLeave}
        img={img}
        handleImageChange={handleImageChange}
        {...props}
      />
    );
  };
};
