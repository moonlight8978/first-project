import {
  LOGIN_REQUEST, LOGIN_SUCCESS, LOGIN_FAILURE,
} from './../const';

const initialState = {
  loading: true,
  error: null,
  success: null,
};

const success = { message: 'OK' };

export default function loginReducer(state = initialState, action) {
  switch (action.type) {
    case LOGIN_REQUEST:
      return initialState;
      break;
    case LOGIN_SUCCESS:
      return Object.assign({}, state, { loading: false, success: success });
      break;
    case LOGIN_FAILURE:
      return Object.assign({}, state, { loading: false, error: action.error.data });
      break;
    default: 
      return state;
      break;
  }
}