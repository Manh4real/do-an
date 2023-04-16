import React, { useEffect, useState } from "react";
import { compressImage } from "../../../helpers";

function AvatarInput({ avatar, validateAvatar, setIsAllValid }) {
  //   const [file, setFile] = useState(avatar);
  const [imageUrl, setImageUrl] = useState(avatar);

  const handleChange = (e) => {
    if (!e.target.files) return;
    if (!e.target.files[0]) return;

    const url = URL.createObjectURL(e.target.files[0]);
    setImageUrl(url);

    compressImage(e.target.files[0], 1, 0.1, (blob) => {
      validateAvatar(blob);
      setIsAllValid();
    });
  };

  useEffect(() => {
    validateAvatar(avatar);
  }, [avatar, validateAvatar]);

  useEffect(() => {
    return () => {
      URL.revokeObjectURL(imageUrl);
    };
  }, [imageUrl]);

  return (
    <>
      {imageUrl && <img src={imageUrl} alt="Your avatar" width={75} />}
      <input
        accept="image/*"
        type="file"
        id="avatar"
        name="avatar"
        onChange={handleChange}
      />
      {/* {validateAvatar(file)} */}
    </>
  );
}

export default AvatarInput;
