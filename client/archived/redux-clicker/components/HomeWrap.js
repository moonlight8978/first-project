import React from 'react';

import { Provider } from 'react-redux';
import { createStore } from 'redux';

import clickedApp from './../reducers';
import Home from './Home';

let store = createStore(clickedApp);

class HomeWrap extends React.Component {
  componentWillUnmount() {
    console.log('Tach');
  }
  
  render() {
    return (
      <Provider store={store}>
        <Home />
      </Provider>
    );
  }
}

export default HomeWrap;