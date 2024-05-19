import { v4 as uuidv4 } from "uuid";

import { api } from "../../api";

import { getAccessTokenFromLocalStorage } from "../../helpers";
import { IProduct, IProductEditFormData, IProductFormData } from "../../types";
import {
  deleteProductImage,
  uploadProductImage as uploadProductImage_firebase,
} from "../../features/firebase";
import { deleteImages, uploadProductImages } from "../images";

export const getProducts = async (page = 1) => {
  const token = getAccessTokenFromLocalStorage();
  const response = await api.get("/products/all", {
    params: {
      page,
    },
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });
  return response.data;
};

export const createNewProduct = async (data: IProductFormData) => {
  const token = getAccessTokenFromLocalStorage();

  const response = await api.post(
    "/products",
    {
      category: data.category,
      product_name: data.product_name,
      type: data.type,
      gender: data.gender,
      target: data.target,
      color_num: data.color_num,
      price: data.price,
      on_sale: data.on_sale,
      old_price: data.price,
      sizes: data.sizes.join(","),
      quantity: data.quantity,
      description: data.description,
      manufacturer_id: data.manufacturer_id,
      style_id: data.style_id,
      type_id: data.type_id,
      stock: data.stock,
      size_type_id: data.size_type_id,
    },
    {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
  );

  if (response.data.status === "success") {
    const newProduct: IProduct | undefined = response.data?.data?.product;

    if (newProduct) {
      const imageFiles = data.images;
      const promises: Promise<string>[] = [];
      const uploadedImagesInfo: IImagePostData[] = [];

      Object.entries(imageFiles).forEach(([colorId, images]) => {
        for (let i = 0; i < images.length; i++) {
          const imageName = uuidv4();
          const b = {
            url: imageName,
            product_id: newProduct.product_id,
            product_color_id: colorId,
          };

          uploadedImagesInfo.push(b);
          promises.push(uploadProductImage_firebase(images[i], imageName));
        }
      });

      await uploadProductImages(uploadedImagesInfo);
      await Promise.all(promises);
    }
  }

  return response.data;
};

interface IImagePostData {
  url: string;
  product_id: string;
  product_color_id: string;
}
export const updateProduct = async (
  product_id: string,
  data: IProductEditFormData
) => {
  const token = getAccessTokenFromLocalStorage();

  const body = {
    category: data.category,
    product_name: data.product_name,
    type: data.type,
    gender: data.gender,
    target: data.target,
    color_num: data.color_num,
    price: data.price,
    on_sale: data.on_sale,
    old_price: data.old_price,
    sizes: data.sizes.join(","),
    quantity: data.quantity,
    description: data.description,
    manufacturer_id: data.manufacturer_id,
    style_id: data.style_id,
    type_id: data.type_id,
    changedStock: data.changedStock,
    removedColors: data.removedColors,
  };
  // const images = data.images; // url
  const addedImages = data.addedImages; // file | blob
  const removedImages = data.removedImages; // url

  const response = await api.put("/products/" + product_id.trim(), body, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });

  // delete images
  if (removedImages) {
    // delete images from database
    const imageIds = Object.entries(removedImages).reduce(
      (acc, [_, images]) => {
        acc.push(...images.map((image) => image.image_id));

        return acc;
      },
      [] as string[]
    );

    if (imageIds.length > 0) {
      await deleteImages(imageIds);
    }

    // delete images from Firebase Storage
    const promises: Promise<void>[] = [];
    Object.entries(removedImages).forEach(([_, images]) => {
      images.forEach((image) => {
        promises.push(deleteProductImage(image.url));
      });
    });
    Promise.all(promises);
  }

  // upload images to Firebase Storage
  if (response.data.status === "success") {
    const promises: Promise<string>[] = [];

    const toUploadImages: IImagePostData[] = [];

    Object.keys(addedImages).forEach((key) => {
      const files = addedImages[key];

      files.forEach((file) => {
        const fileName = uuidv4();

        if (file instanceof File || file instanceof Blob) {
          promises.push(uploadProductImage_firebase(file, fileName));
        }

        toUploadImages.push({
          product_color_id: key,
          product_id: data.product_id,
          url: fileName,
        });
      });
    });

    if (toUploadImages.length > 0) {
      await uploadProductImages(toUploadImages);
    }
    await Promise.all(promises);
  }

  return response.data;
};
export const deleteProduct = async (productId: string) => {
  const token = getAccessTokenFromLocalStorage();

  const response = await api.post("/products/delete/" + productId, null, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });

  if (response.data.status === "success") {
    const imageNames = response.data?.data?.images;

    if (Array.isArray(imageNames) && imageNames.length > 0) {
      for (let i = 0; i < imageNames.length; i++) {
        await deleteProductImage(imageNames[i].url);
      }
    }
  }

  return true;
};

export const searchProducts = async (q: string) => {
  try {
    const response = await api.get("/search/all", {
      params: {
        q,
      },
    });

    return response.data;
  } catch (err) {
    console.log(err);
  }
};

export const getProductStatuses = async () => {
  try {
    const response = await api.get("/product-statuses");

    return response.data.data.product_statuses;
  } catch (err) {
    console.log(err);
  }
};
export const updateProductStatus = async (
  id: string,
  product_status_id: string,
  options = {}
) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    await api.put(
      "/products/status/" + id,
      {
        product_status_id,
      },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    return true;
  } catch (err) {
    console.log(err);
  }

  return false;
};
