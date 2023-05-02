export interface IUser {
    user_id: string,
    email: string,
    first_name: string,
    last_name: string,
    birthday: string,
    country: string,
    registration_time: number,
    avatar: string,
    role: IRole,
}
export interface IUserFormData {
    email: string,
    first_name: string,
    last_name: string,
    birthday: string,
    country: string,
    password: string,
    avatar: File | Blob | null,
    role: IRole,
}
export type IRole = "0" | "1" | "2";
export type IGender = "male" | "female" | "unisex";
export enum InputType {
    EMAIL = "email",
    PASSWORD = "password",
    FIRSTNAME = "first_name",
    LASTNAME = "last_name",
}
export enum ProductInputType {
    NAME = "product_name",
    CATEGORY = 'category',
    TARGET = 'target',
    PRICE = 'price',
    QUANTITY = "quantity",
    DESCRIPTION = 'description'
}

export interface IProductImage {
    image_id: string
    product_color_id: string
    product_id: string
    url: string
}
export interface IProduct {
    product_id: string,
    category: string,
    product_name: string,
    type: string,
    gender: string,
    target: string,
    color_num: number,
    price: number,
    on_sale: boolean,
    old_price: number,
    sizes: string[],
    sales: number,
    quantity: number,
    created_at: string,
    description: string,
    style_id: string,
    type_id: string,
    images: {
        [key: string]: IProductImage[]
    },
    manufacturer_id: string,
    size_type_id: string,
    stock: {
        [key: string]: {
            stock_id: string,
            color_id: string,
            color_name: string,
            product_id: string,
            quantity: number,
            size_id: string,
            size: string,
            size_type_id: string,
            size_type_name: string,
        }[]
    }
}

export type IProductFormData = Omit<IProduct, "product_id" | "created_at" | "images" | "stock"> & {
    images: {
        [key: string]: (File | Blob)[]
    },
    colors: string[],
    stock: {
        [key: string]: {
            color_id: string,
            quantity: number,
            size_id: string,
        }[]
    }
}
export type IProductEditFormData = Omit<IProduct, "stock"> & {
    colors: string[],
    removedColors: string[],
    addedImages: {
        [key: string]: (File | Blob)[]
    },
    removedImages?: {
        [key: string]: IProductImage[]
    },
    stock: {
        [key: string]: {
            stock_id: string,
            color_id: string,
            color_name: string,
            product_id: string,
            quantity: number,
            size_id: string,
            size: string,
            size_type_id: string,
            size_type_name: string,
        }[]
    },
    changedStock: {
        [key: string]: {
            color_id: string,
            quantity: number,
            size_id: string,
        }[]
    }
}

export type IClothesSizes = "XS" | "S" | "M" | "L" | "XL" | "2XL" | "3XL" | "4XL"
export type IShoesSizes = "4" | "4.5" | "5" | "5.5" | "6" | "6.5" | "7" | "7.5" | "8" | "8.5" | "9" | "9.5" | "10" | "10.5" | "11" | "11.5" | "12" | "12.5" | "13" | "13.5" | "14" | "14.5" | "15" | "15.5";

export interface IManufacturer {
    manufacturer_id: string;
    manufacturer_name: string;
    brand_name: string;
}
export interface IProductTypes {
    type_id: string;
    type_name: string;
}
export interface IProductStyle {
    style_id: string;
    style_name: string;
}

export type OrderStatus = "prepared" | "ready" | "canceled" | "delivering" | "delivered" | "done";
export interface IOrder {
    order_id: string,
    status: OrderStatus,
    order_status_id: string,
    order_status_name: OrderStatus,
    address: string,
    phone: string,
    receiver: string,
    user_id: string,
    customer_name: string,
    email: string,
    est_arrived_date: string,
    created_at: string,
    total_price: number
}
export interface IOrderItem {
    order_item_id: string,
    product_id: string,
    color_id: string,
    quantity: number,
    size: string,
    color_name: string,
    product: IProduct
}
export interface IOrders {
    [key: string]: (IOrder & IOrderItem)[];
}

export interface ISize {
    size_id: string;
    size_type_id: string;
    size_type_name: string;
    size: string;
}

export interface IStock {
    stock_id: string,
    color_id: string,
    quantity: number,
    size_id: string,
    size: string,
}
export interface IColor {
    color_id: string,
    color_name: string,

    sizes: IStock[],
}
export interface IInventoryProduct {
    product_id: string,
    product_name: string,
    type: string,
    gender: string,
    price: number,
    created_at: string,
    manufacturer_id: string,
    manufacturer_name: string,
    style_id: string,
    type_id: string,
    type_name: string,
    size_type_id: string,

    colors: { [color_id: string]: IColor },
    images: {
        [color_id: string]: IProductImage[]
    }
}
export interface IProductInventory {
    [product_id: string]: IInventoryProduct
}

export interface IReview {
    product_id: string,
    user_id: string,
    review: string,
    rating: number,
    created_at: string,
    title: string,
    user_name: string,
    email: string,
    product_name: string,
    avatar: string,

    images: {
        [color_id: string]: IProductImage[]
    }
}