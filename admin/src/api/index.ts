import axios from 'axios';

export const api = axios.create({
    baseURL: "http://localhost:3005/api/v1"
})
export const authApi = axios.create({
    baseURL: "http://localhost:4000/auth"
})