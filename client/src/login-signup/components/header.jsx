import React from 'react';

function Header({ icon, title }) {
  return (
    <div className="form-header">
      <div className="logo">
        <span>
          <i className={`fa fa-fw fa-${icon}`} />
        </span>
      </div>
      <div className="title">
        <h4>{title}</h4>
      </div>
    </div>
  );
}

export default Header;