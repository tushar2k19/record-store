  import axios from 'axios';
  // import {process} from "karma/lib/cli";

  // API_URL = process.env.REACT_APP_API_URL;

  const API_URL = "http://localhost:3000"

  const securedAxiosInstance = axios.create({
    baseURL: API_URL,
    withCredentials: true,
    headers: {
      'Content-Type': 'application/json',
    }
  })

  const plainAxiosInstance = axios.create({
    baseURL: API_URL,
    withCredentials: true,
    headers: {
      'Content-Type': 'application/json',
    }
  })

  securedAxiosInstance.interceptors.request.use(config => { //Interceptors are functions that run before a request is sent, allowing you to modify the request configuration.
    const method = config.method.toUpperCase();
    if (method !== 'OPTIONS' && method !== 'GET')
    {
      config.headers = {
        ...config.headers,
        'X-CSRF-TOKEN': localStorage.csrf
      }
    }
    console.log("inside index1.js, config = ", config)
    return config
  })

  securedAxiosInstance.interceptors.response.use(null, error => {
    if(error.response && error.response.config && error.response.status === 401) {
      return plainAxiosInstance.post('/refresh', {}, {headers: {'X-CSRF-TOKEN': localStorage.csrf}}).then(response => {
        localStorage.csrf = response.data.csrf
        localStorage.signedIn = true

        let retryConfig = error.response.config
        retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
         // return plainAxiosInstance.retry(retryConfig)
        return plainAxiosInstance.request(retryConfig)
      }).catch(error => {
        delete localStorage.csrf
        delete localStorage.signedIn

        location.replace('/')
        return Promise.reject(error)
      })
    }else
    {
      return Promise.reject(error)
    }
  })


  export {securedAxiosInstance, plainAxiosInstance}
