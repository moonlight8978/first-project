import React from 'react';

import Error from './error';

const Forbidden = function Forbidden({}) {
  return (
    <Error 
      status={403} 
      statusText="Access denied" 
      message="Access is denied! Your authority did not meet requirement!"
    />
  );
}

const Unauthorized = function Unauthorized({}) {
  return (
    <Error 
      status={401} 
      statusText="Unauthorized" 
      message="You must login to access this page!"
    />
  );
}


export { Forbidden, Unauthorized };