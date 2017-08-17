import axios from 'axios';

const loginUrl = '/api/login';
export function loginRequestToServer(user) {
  return axios.post(loginUrl, user);
}