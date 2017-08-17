import React from 'react';

import { Link } from 'react-router-dom';

import ButtonC from './button-c';

import './button-c.css';

function ButtonCLink({ type, color, to, children, onClick, ...rest }) {
  const classNames = `btn-c btn-c-${type} btn-c-5-${color}`;
   
  return (
    <Link to={to} {...rest}>
      <ButtonC type={type} color={color} onClick={onClick}>
        {children}
      </ButtonC>
    </Link>
  );
}

export default ButtonCLink;