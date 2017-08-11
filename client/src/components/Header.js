import React from 'react';

import { Link } from 'react-router-dom';

class Header extends React.Component {
  render() {
    return (
      <div>
        <Link to="/">Link to Home</Link>
        <Link to="/about">Link to About</Link>
      </div>
    );
  }
}

export default Header;