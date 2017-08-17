import { createStore, applyMiddleware, combineReducers, compose } from 'redux';
import thunk from 'redux-thunk';

import novelReducer from 'db/novel/reducers';
import { authenticationReducers } from 'components/authentication';
import { logoutReducer } from 'navbar';
import { loginReducer } from 'login-signup/reducers';

const reducers = combineReducers({
  novel: novelReducer,
  auth: authenticationReducers,
  login: loginReducer,
  logout: logoutReducer,
});

const composeEnhancers =
  typeof window === 'object' &&
  window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ ?   
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({
      // Specify extension’s options like name, actionsBlacklist, actionsCreators, serialize...
    }) : compose;

const enhancer = composeEnhancers(
  applyMiddleware(thunk),
  // other store enhancers if any
);
const store = createStore(
  reducers,
  enhancer,
);

export default store;