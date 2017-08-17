import React from 'react';

import './page-header.css';

function PageHeader({ ja, en }) {
  return (
    <div className="page-head bb">
      <div className="container">
        <h3>{ ja }</h3>
        <h6>{ en }</h6>
      </div>
    </div>
  );
}

export default PageHeader;