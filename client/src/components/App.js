import React from 'react';

import { Route } from 'react-router-dom';

import HomeWrap from './HomeWrap';
import About from './About';

class App extends React.Component {
  render() {
    return (
      <div>
        <Route exact path="/" component={HomeWrap} />
        <Route exact path="/about" component={About} />
      </div>
    );
  }
}

export default App;