import React from 'react';

import Navbar from 'navbar';
import Body from './body';
import Authentication from 'components/authentication';

import './app.css';

class App extends React.Component {
  render() {
    return (
      <div>
        <Authentication />
        <Navbar />
        <Body />
      </div>
    );
  }
}

export default App;