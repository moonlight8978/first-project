import React from 'react';
import ReactDOM from 'react-dom';

import { BrowserRouter } from 'react-router-dom';

import App from './components/App';
import Header from './components/Header';

ReactDOM.render(
  <BrowserRouter>
    <div>
      <Header />
      <App />
    </div>
  </BrowserRouter>,
  document.getElementById('root'),
);