import React from 'react';

function Button({ onClick, number }) {
  return <button onClick={onClick}>Button {number}</button>
}

export default Button;