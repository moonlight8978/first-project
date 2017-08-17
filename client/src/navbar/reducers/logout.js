import {
  LOGOUT_REQUEST, LOGOUT_SUCCESS, LOGOUT_FAILURE,
} from './../const';

const initialState = {
  loading: true,
  error: null,
  success: null,
};

const success = { message: 'OK' };

export default function logoutReducer(state = initialState, action) {
  switch (action.type) {
    case LOGOUT_REQUEST:
      return initialState;
      break;
    case LOGOUT_SUCCESS:
      return Object.assign({}, state, { loading: false, success: success });
      break;
    case LOGOUT_FAILURE:
      return Object.assign({}, state, { loading: false, error: action.error.data });
      break;
    default: 
      return state;
      break;
  }
}