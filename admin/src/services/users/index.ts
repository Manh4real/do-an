import { v4 as uuidv4 } from 'uuid';

import { api, authApi } from "../../api"
import { deleteUserAvatar, uploadUserAvatar } from "../../features/firebase";

import { getAccessTokenFromLocalStorage, setAccessTokenAtLocalStorage } from "../../helpers";
import { IUserFormData, IUser } from "../../types";

interface ISignInParams {
    email: string,
    password: string
}
interface ISignInReponse {
    user: IUser | null;
    error?: string;
    status: "success" | "error"
}

export const getMe = async (accessToken: string) => {
    const userResponse = await api.get("/me", {
        headers: {
            Authorization: `Bearer ${accessToken}`
        }
    });

    const user = userResponse.data.data.user;

    return user;
}

export const signIn = async ({ email, password }: ISignInParams): Promise<ISignInReponse> => {
    const response = await authApi.post("/a/signin", {
        email,
        password
    })

    let user = null;
    if (response.data) {
        setAccessTokenAtLocalStorage(response.data.accessToken);

        if (response.data.accessToken) {
            const token = response.data.accessToken;

            const userResponse = await api.get("/me", {
                headers: {
                    Authorization: `Bearer ${token}`
                }
            });

            user = userResponse.data.data.user;
        }
    }

    return { status: response.data.status, user };
}

export const getUsers = async (page = 1) => {
    const token = getAccessTokenFromLocalStorage();
    const response = await api.get("/users", {
        params: {
            page
        },
        headers: {
            Authorization: `Bearer ${token}`
        }
    });
    return response.data;
}

const DEFAULT_AVATAR = "default-avatar.png";
export const createNewUser = async (data: IUserFormData) => {
    const token = getAccessTokenFromLocalStorage();

    const avatarFile = data.avatar;
    const temp = uuidv4();
    const avatarName = avatarFile ? temp : DEFAULT_AVATAR;

    const response = await api.post("/users", {
        ...data,
        avatar: avatarName
    }, {
        headers: {
            Authorization: `Bearer ${token}`
        }
    })

    if (response.data.status === "success") {
        if (avatarFile) {
            await uploadUserAvatar(avatarFile, temp);
        }
    }

    return response.data;
}

type IBody = Omit<IUserFormData, "avatar" | "password"> & {
    avatar?: string
}
export const updateUser = async (user_id: string, data: Omit<IUserFormData, "password">) => {
    const token = getAccessTokenFromLocalStorage();

    const avatarFile = data.avatar;
    const temp = uuidv4();
    const avatarName = avatarFile ? temp : DEFAULT_AVATAR;

    const common = {
        first_name: data.first_name,
        last_name: data.last_name,
        email: data.email,
        birthday: data.birthday,
        country: data.country,
        // password: data.password,
        role: data.role
    }

    const body: IBody = { ...common, avatar: avatarName };

    if (!(avatarFile instanceof File) && !(avatarFile instanceof Blob)) {
        delete body.avatar;
    }

    const response = await api.put("/users/" + user_id.trim(), body, {
        headers: {
            Authorization: `Bearer ${token}`
        }
    })

    if (response.data.status === "success") {
        if (avatarFile instanceof File || avatarFile instanceof Blob) {
            await uploadUserAvatar(avatarFile, temp);

            const oldAvatarName: string = response.data.data?.addition?.old_avatar || "";
            if (oldAvatarName) await deleteUserAvatar(oldAvatarName)
        }
    }

    return response.data;
}
export const deleteUser = async (userId: string) => {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.post("/delete/users/" + userId, null, {
        headers: {
            Authorization: `Bearer ${token}`
        }
    })

    if (response.data.status === "success") {
        const avatarName = response.data?.data?.user?.avatar;

        if (avatarName) {
            await deleteUserAvatar(avatarName);
        }
    }

    return true;
}

export const searchUsers = async (q: string) => {
    try {
        const token = getAccessTokenFromLocalStorage();
        const response = await api.get("/users/search", {
            params: {
                q
            },
            headers: {
                Authorization: `Bearer ${token}`
            }
        })

        return response.data;
    } catch (err) {
        console.log(err);
    }
}