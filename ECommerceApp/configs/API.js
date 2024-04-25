import axios from "axios";


const HOST = 'https://thanhhy.pythonanywhere.com'

export const endpoints ={
    'categories': '/categories/',
    'store': '/store/'
}

export const authApi = () => {
    return axios.create({
        baseURL: HOST,
        headers: {
            'Authorization': 'Bearer ...'
        }
    })
}

export default axios.create({
    baseURL: HOST
})