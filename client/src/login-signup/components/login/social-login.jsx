import React from 'react';

class SocialLogin extends React.Component {
  constructor() {
    super();
    this.googleLogin = this.googleLogin.bind(this);
    this.twitterLogin = this.twitterLogin.bind(this);
    this.facebookLogin = this.facebookLogin.bind(this);
  }
  
  googleLogin(event) {
    event.preventDefault();
  }
  
  twitterLogin(event) {
    event.preventDefault();
  }
  
  facebookLogin(event) {
    event.preventDefault();
  }
  
  render() {
    return (
      <div className="social-login col-lg-6">
        <div>
          <a href="#" onClick={this.googleLogin} className="google">
            <span>Googleアカウントでログイン</span>
          </a>
        </div>
        <div>
          <a href="#" onClick={this.twitterLogin} className="twitter">
            <span>Twitterアカウントでログイン</span>
          </a>
        </div>
        <div>
          <a href="#" onClick={this.facebookLogin} className="facebook">
            <span>Facebookアカウントでログイン</span>
          </a>
        </div>
      </div>
    );
  }
  
}

export default SocialLogin;