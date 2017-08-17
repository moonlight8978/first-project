import jwtDecode from 'jwt-decode';

import {
  LOGIN_REQUEST, LOGIN_SUCCESS, LOGIN_FAILURE,
  LOGOUT_REQUEST, LOGOUT_SUCCESS, LOGOUT_FAILURE,
} from './const';
import { loginRequestToServer } from './api';
import { authenticate } from 'components/authentication/actions';

function _loginRequest() {
  return {
    type: LOGIN_REQUEST
  };
}

function _loginSuccess() {
  return {
    type: LOGIN_SUCCESS,
  };
}

function _loginFailure(error) {
  return {
    type: LOGIN_FAILURE,
    error: error,
  };
}

export function login(_user) {
  return async (dispatch) => {
    dispatch(_loginRequest());
    
    try {
      const response = await loginRequestToServer(_user);
      console.log(response.headers);
      
      const user = response.data;
      const token = response.headers['x-token'];
      const exp = jwtDecode(token).exp;
      
      const auth = { user, token, exp };
      console.log(auth);
      localStorage.setItem('auth', JSON.stringify(auth));
      
      dispatch(authenticate(true));
      dispatch(_loginSuccess());
    } catch (error) {
      console.log(error);
      dispatch(_loginFailure(error.response));
    }
  };
}

function _logoutRequest() {
  return {
    type: LOGOUT_REQUEST
  };
}

function _logoutSuccess() {
  return {
    type: LOGOUT_SUCCESS
  };
}

function _logoutFailure(error) {
  return {
    type: LOGOUT_FAILURE,
    error,
  };
}

export function logout() {
  return async (dispatch) => {
    dispatch(_logoutRequest());
    
    try {
      // request to logout
      localStorage.removeItem('auth');
      dispatch(_logoutSuccess());
      dispatch(authenticate(false));
    } catch (error) {
      console.log(error.response);
      dispatch(_logoutFailure(error.response));
    }
  };
}

