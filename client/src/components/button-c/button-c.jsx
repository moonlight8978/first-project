import React from 'react';

import './button-c.css';

function ButtonC({ type, color, children, onClick }) {
  const classNames = `btn-c btn-c-${type} btn-c-5-${color}`;
   
  return (
    <button className={classNames} onClick={onClick}>
      {children}
    </button>
  );
}

export default ButtonC;