import React, { useEffect, useState } from "react";
import { getColorNameById } from "services/colors";

function BagProductColor({ colorId }) {
  const [colorName, setColorName] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getColorNameById(colorId, { signal: controller.signal })
      .then((name) => {
        setColorName(name);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, [colorId]);

  return (
    <p style={{ marginBlock: 5 }}>
      {colorName && colorName[0].toUpperCase() + colorName.slice(1)}
    </p>
  );
}

export default BagProductColor;
