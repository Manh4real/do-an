// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {
    getStorage,
    ref,
    getDownloadURL,
    uploadBytes,
    deleteObject,
    getBlob,
} from "firebase/storage";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDzJEyFwM0qCCBCbqpn3bIWmjJ2mVSjd50",
    authDomain: "web4tw-b9ece.firebaseapp.com",
    projectId: "web4tw-b9ece",
    storageBucket: "web4tw-b9ece.appspot.com",
    messagingSenderId: "700498149972",
    appId: "1:700498149972:web:c77ccb11e8e515fed0e3c1",
    measurementId: "G-4Y8B4HGKH5"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Cloud Storage and get a reference to the service
export const storage = getStorage(app);

// Create a storage reference from our storage service
// This reference points to the root of your Cloud Storage bucket.
// const storageRef = ref(storage, "user_avatar/default-avatar.png");

export const getStorageRef = (path: string) => ref(storage, path);
export const getDownloadImage = async (imageName: string) => {
    try {
        const url = await getDownloadURL(
            ref(storage, "/product_images/" + imageName)
        );

        return url;
    } catch (error: any) {
        // A full list of error codes is available at
        // https://firebase.google.com/docs/storage/web/handle-errors
        switch (error.code) {
            case "storage/unauthorized":
                // User doesn't have permission to access the object
                console.log("User doesn't have permission to access the object");
                break;
            case "storage/canceled":
                // User canceled the upload
                console.log("User canceled the download");
                break;
            case "storage/unknown":
                console.log("Unknown error occurred, inspect error.serverResponse");
                break;
            default:
                break;
        }
    }

    return "";
};

export const getDownloadUserAvatar = async (avatarName: string) => {
    try {
        const url = await getDownloadURL(
            ref(storage, "/user_avatar/" + avatarName)
        );

        return url;
    } catch (error: any) {
        // A full list of error codes is available at
        // https://firebase.google.com/docs/storage/web/handle-errors
        switch (error.code) {
            case "storage/unauthorized":
                // User doesn't have permission to access the object
                console.log("User doesn't have permission to access the object");
                break;
            case "storage/canceled":
                // User canceled the upload
                console.log("User canceled the download");
                break;
            case "storage/unknown":
                console.log("Unknown error occurred, inspect error.serverResponse");
                break;
            default:
                break;
        }
    }
};

export const getBlobImage = async (imageName: string) => {
    try {
        const blob = await getBlob(
            ref(storage, "/product_images/" + imageName)
        );

        return blob;
    } catch (error: any) {
        // A full list of error codes is available at
        // https://firebase.google.com/docs/storage/web/handle-errors
        switch (error.code) {
            case "storage/unauthorized":
                // User doesn't have permission to access the object
                console.log("User doesn't have permission to access the object");
                break;
            case "storage/canceled":
                // User canceled the upload
                console.log("User canceled the download");
                break;
            case "storage/unknown":
                console.log("Unknown error occurred, inspect error.serverResponse");
                break;
            default:
                break;
        }
    }
};

export const uploadProductImage = async (fileAsBlob: Blob | Uint8Array | ArrayBuffer | File, fileName: string) => {
    const snapshot = await uploadBytes(
        getStorageRef("/product_images/" + fileName),
        fileAsBlob
    );
    const url = await getDownloadURL(snapshot.ref);
    console.log("Uploaded a blob or file named " + fileName + " to Firebase.");

    return url;
};
export const deleteProductImage = async (fileName: string) => {
    try {
        await deleteObject(getStorageRef("/product_images/" + fileName));
        console.log("Deleted file " + fileName + " from Firebase");
    } catch (err) {
        console.log("Couldn't delete file " + fileName + " from Firebase");
        console.log({ err });
    }
};

export const uploadUserAvatar = async (fileAsBlob: Blob | Uint8Array | ArrayBuffer | File, fileName: string) => {
    const snapshot = await uploadBytes(
        getStorageRef("/user_avatar/" + fileName),
        fileAsBlob
    );
    const url = await getDownloadURL(snapshot.ref);
    console.log("Uploaded a blob or file named " + fileName + " to Firebase.");

    return url;
};
export const deleteUserAvatar = async (fileName: string) => {
    try {
        await deleteObject(getStorageRef("/user_avatar/" + fileName));
        console.log("Deleted file " + fileName + " from Firebase");
    } catch (err) {
        console.log("Couldn't delete file " + fileName + " from Firebase");
        console.log({ err });
    }
};