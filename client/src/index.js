import React from 'react';
import ReactDOM from 'react-dom';

import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'react-redux';

import store from './stores/create-store';
import App from './app';
import config from './api';

import 'bootstrap/dist/css/bootstrap.css';
import 'font-awesome/css/font-awesome.css';
import 'animate.css';

config();
const root = document.getElementById('root');

ReactDOM.render(
  <Provider store={store}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>,
  root
);