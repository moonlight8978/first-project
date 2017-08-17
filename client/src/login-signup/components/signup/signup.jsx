import React from 'react';

import { Route, Switch, withRouter } from 'react-router-dom';
import { TransitionGroup, CSSTransition } from 'react-transition-group';

import SignupForm from './signup-form';
import Header from './../header';

class Signup extends React.Component {
  constructor() {
    super();
  }
  
  render() {
    const icon = 'user-plus';
    const title = 'サインアップ';
    
    return (
      <div className="form-auth form-signup">
        <Header icon={icon} title={title} />
        <SignupForm />
      </div>
    );
  }
}

export default Signup;