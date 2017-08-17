import React from 'react';

import Login from './login';
import Signup from './signup';
import PageHeader from 'components/page-header';
import { LoggedUserIsNotAllowed } from 'components/authorization';

import './login.css';

class LoginSignup extends React.Component {
  render() {
    return (
      <div className="page-wrap">
        <PageHeader 
          ja="ログイン・サインアップ" 
          en="Login - Signup"
        />
        <Login />
        <Signup />
      </div>
    );
  }
}

export default LoggedUserIsNotAllowed(LoginSignup);