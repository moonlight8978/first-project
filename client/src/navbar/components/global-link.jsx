import React from 'react';

import { Link } from 'react-router-dom';

function GlobalLink() {
  return (
    <div className="-main">
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to="/" className="nav-link">
            ホーム
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/" className="nav-link">
            製品
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/" className="nav-link">
            データベース
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/" className="nav-link">
            企業情報
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/" className="nav-link">
            接触
          </Link>
        </li>
      </ul>
    </div>
  );
}

export default GlobalLink;