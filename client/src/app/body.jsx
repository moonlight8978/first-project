import React from 'react';

import { withRouter } from 'react-router-dom';

import Routes from './routes';

function Body(props) {
  return (
    <div className="animated fadeIn">
      <Routes />
    </div>
  );
}

export default withRouter(Body);