import { 
  AUTHENTICATE,
  AUTH_TOKEN_EXPIRATION_CHECK_SUCCESS,
  AUTH_TOKEN_EXPIRATION_CHECK_FAILURE,
} from './const';

function _authenticate({ user, token, exp }) {
  return {
    type: AUTHENTICATE,
    user,
    token,
    exp,
  };
}

export function authenticate(isAuthenticated) {
  return (dispatch) => {
    if (isAuthenticated) {
      const { user, token, exp } = JSON.parse(localStorage.auth);
      dispatch(_authenticate({ user, token, exp }));
    } else {
      dispatch(_authenticate({ user: null, token: null, exp: null }));
    }
  };
}

function _authTokenExpirationCheckSuccess() {
  return {
    type: AUTH_TOKEN_EXPIRATION_CHECK_SUCCESS
  };
}

function _authTokenExpirationCheckFailure() {
  return {
    type: AUTH_TOKEN_EXPIRATION_CHECK_FAILURE
  };
}

export function authTokenExpirationCheck() {
  return (dispatch) => {
    const now = Date.now() / 1000;
    const { exp } = JSON.parse(localStorage.auth);
    
    if (exp > now) {
      console.log(1);
      dispatch(_authTokenExpirationCheckSuccess());
    } else {
      console.log(0);
      dispatch(_authTokenExpirationCheckFailure());
    }
  };
}