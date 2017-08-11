import React from 'react';

import { Link, Route } from 'react-router-dom';

class Header extends React.Component {
  render() {
    return (
      <nav>
        <Link to="/">Home</Link>
        <Link to="/novels">All novels</Link>
        <Link to={{ pathname: '/novels/1' }}>Novel no.1</Link>
      </nav>
    );
  }
}

export default Header;