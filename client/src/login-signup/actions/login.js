import jwtDecode from 'jwt-decode';

import { LOGIN_REQUEST, LOGIN_SUCCESS, LOGIN_FAILURE } from './const';
import { loginRequestToServer } from './../api';
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

function login(_user) {
  return async (dispatch) => {
    dispatch(_loginRequest());
    
    try {
      const response = await loginRequestToServer(_user);
      
      const user = response.data;
      const token = response.headers['x-token'];
      const exp = jwtDecode(token).exp;
      
      const auth = { user, token, exp };
      console.log(auth);
      localStorage.setItem('auth', JSON.stringify(auth));
      
      // order is important, because of LoggedUserIsNotAllowed HOC
      dispatch(_loginSuccess());
      dispatch(authenticate(true));
      return(1);
    } catch (error) {
      console.log(error);
      dispatch(_loginFailure(error.response));
      throw new Error('Error');
    }
  };
}

export default login;