import React from 'react';

import LoginForm from './login-form';
import SocialLogin from './social-login';
import Header from './../header';

function Login() {
  const icon = 'user';
  const title = 'ログイン';
  
  return (
    <div className="form-auth login-form">
      <Header icon={icon} title={title} />
      <div className="row">
        <LoginForm />
        <SocialLogin />
      </div>
    </div>
  );
}

export default Login;