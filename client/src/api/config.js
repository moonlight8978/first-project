import axios from 'axios';

const server = {
  url: 'localhost',
  port: 3000,
  db: '/api/db',
  login: '/api/login',
  logout: '/api/logout',
}

export { server };

function config() {
  axios.defaults.baseURL = 'http://localhost:3000';
  axios.defaults.headers['Content-Type'] = 'application/json';
  axios.defaults.headers['Accept'] = 'application/json;v=1';
  axios.interceptors.request.use(
    function (config) {
      if (localStorage.auth) {
        const { token } = JSON.parse(localStorage.auth);
        config.headers['Authorization'] = `Bearer ${token}`;
      }
      
      return config;
    }, function (error) {
      return Promise.reject(error);
    }
  );
}

export default config;