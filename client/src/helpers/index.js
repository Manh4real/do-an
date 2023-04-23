export function setAccessTokenAtLocalStorage(value) {
  localStorage.setItem("accessToken", JSON.stringify(value));
}
export function getAccessTokenFromLocalStorage() {
  const a = localStorage.getItem("accessToken");
  return a && JSON.parse(a);
}
export function clearBagFromLocalStorage() {
  localStorage.setItem("bag", JSON.stringify([]));
}

export function getBagFromLocalStorage() {
  const bag = localStorage.getItem("bag");
  return bag && JSON.parse(bag);
}
export function setBagAtLocalStorage(product) {
  let bag = getBagFromLocalStorage();

  if (!bag) {
    bag = [];
  }

  bag.push({
    product_id: product.product_id,
    added: product.added,
  });

  localStorage.setItem("bag", JSON.stringify(bag));
}
export function modifyBagAtLocalStorage(modified) {
  const bag = getBagFromLocalStorage();

  if (!bag) return;

  const { baggedId, modifiedType, modifiedValue } = modified;

  const newBag = bag
    .filter((p) => p.product_id)
    .map((p) => {
      if (p.added.baggedId === baggedId) {
        p.added[modifiedType] = modifiedValue;
      }

      return p;
    });

  localStorage.setItem("bag", JSON.stringify(newBag));
}

export function removeFromBagLocalStorage(baggedId) {
  const bag = getBagFromLocalStorage();

  if (!bag) return;

  const newBag = bag.filter((p) => p.added.baggedId !== baggedId);

  localStorage.setItem("bag", JSON.stringify(newBag));
}

export const countryFromCountryCode = (code) => {
  let regionNames = new Intl.DisplayNames(["en"], { type: "region" });
  return regionNames.of(code);
};

export function compressImage(
  imageFile,
  resizingFactor = 1,
  quality,
  onSuccess
) {
  // showing the compressed image
  const canvas = document.createElement("canvas");
  const context = canvas.getContext("2d");

  const image = document.createElement("img");
  image.crossOrigin = "anonymous";

  image.src = URL.createObjectURL(imageFile);

  image.onload = function () {
    const originalWidth = this.width;
    const originalHeight = this.height;

    const canvasWidth = originalWidth * resizingFactor;
    const canvasHeight = originalHeight * resizingFactor;

    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    context.drawImage(
      this,
      0,
      0,
      originalWidth * resizingFactor,
      originalHeight * resizingFactor
    );

    // reducing the quality of the image
    canvas.toBlob(
      (blob) => {
        if (blob) {
          onSuccess(blob);
        }
      },
      imageFile.type,
      quality
    );
  };
}

export const formatCurrency = (value) => {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  })
    .format(value)
    .slice(0, -2);
};
