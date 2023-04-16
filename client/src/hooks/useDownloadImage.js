import { useState, useEffect } from "react";

import { getDownloadImage } from "features/firebase";

const useDownloadImage = (imageName = "default-product-image.png") => {
  const [url, setUrl] = useState("");

  useEffect(() => {
    let ignore = false;
    getDownloadImage(imageName).then((url) => {
      !ignore && setUrl(url);
    });

    return () => {
      ignore = true;
    };
  }, [imageName]);

  return { url };
};

export default useDownloadImage;
