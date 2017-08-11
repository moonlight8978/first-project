import { ON_CLICK, RESET_STORE } from './../actions';

const initialState = {
  clicked: 0
}

function clickedApp(state = initialState, action) {
  switch (action.type) {
    case ON_CLICK:
      return Object.assign({}, state, { clicked: action.clicked });
    case RESET_STORE:
      return initialState;
    default:
      return state;
  }
}

export default clickedApp;

