import { 
  AUTHENTICATE,
  AUTH_TOKEN_EXPIRATION_CHECK_SUCCESS,
  AUTH_TOKEN_EXPIRATION_CHECK_FAILURE,
} from './const';

const initialState = {
  isAuthenticated: false,
  user: null,
  token: null,
  exp: null,
}

function authenticationReducers(state = initialState, action) {
  switch (action.type) {
    case AUTHENTICATE:
      const isAuthenticated = (action.user && action.token && action.exp) ? true : false;
      return Object.assign({}, state, { isAuthenticated: isAuthenticated, 
                                        user: action.user,
                                        token: action.token,
                                        exp: action.exp });
    case AUTH_TOKEN_EXPIRATION_CHECK_SUCCESS:
      return state;
    case AUTH_TOKEN_EXPIRATION_CHECK_FAILURE:
      return initialState;
    default:
      return state;
  }
}

export default authenticationReducers;