import React from 'react';

import { Link, Route } from 'react-router-dom';

import Header from './../header';
import Main from './../main';

class App extends React.Component {
  constructor() {
    super();
  }
  
  render() {
    return (
      <div>
        <Header />
        <Main />
      </div>
    );
  }
}

export default App;