import React from 'react';

import { connect } from 'react-redux';
import { Link, withRouter } from 'react-router-dom';

import { login } from './../../actions'; 
import { ButtonC, ButtonCLink } from 'components/button-c';

class LoginForm extends React.Component {
  constructor() {
    super();
    
    this.state = {
      login: '',
      password: '',
      showPassword: false,
      rememberMe: false,
    };
    
    this.login = this.login.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;
    
    this.setState({
      [name]: value
    });
  }
  
  async login(event) {
    event.preventDefault();
    const user = {
      login: this.state.login, 
      password: this.state.password,
    };
    try {
      await this.props.login(user);
      this.props.history.push('/');
    } catch (e) {
      
    }
  }
    
  render() {
    const { login, password, showPassword, rememberMe } = this.state;
    const passwordType = showPassword ? 'text' : 'password';
    const { error, loading, success } = this.props;
    const errorRows = error && Object.keys(error).map((key) => {
      return <div>{error[key]}</div>
    });
    
    return (
      <form className="col-lg-6">
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-user" />
          </span>
          <input required 
            name="login"
            type="text"
            className="form-control"
            placeholder="Username or Email"
            value={login}
            onChange={this.handleChange}
          />
        </div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-lock" />
          </span>
          <input required 
            name="password"
            type="text"
            className="form-control"
            placeholder="Password"
            value={password}
            onChange={this.handleChange}
          />
          <small className="form-text text-muted text-right">
            <div className="form-check">
              <label className="form-check-label">
                <input
                  name="showPassword"
                  type="checkbox"
                  className="form-check-input"
                  checked={showPassword}
                  onChange={this.handleChange}
                />
                パスワードを表示する
              </label>
            </div>
          </small>
        </div>
        <div className="form-error animated fadeIn">
          {errorRows}
        </div>
        <div className="form-submit">
          <ButtonC onClick={this.login} color="sakura" type="5">
            ログイン
          </ButtonC>
        </div>
        <div className="form-check remember-me text-muted">
          <label className="form-check-label">
            <input
              name="rememberMe"
              type="checkbox"
              className="form-check-input"
              checked={rememberMe}
              onChange={this.handleChange}
            />
            次回から自動でログインする
          </label>
        </div>
        <div className="form-link">
          <a>パスワードを忘れた方</a>
        </div>
      </form>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    loading: state.login.loading,
    success: state.login.success,
    error: state.login.error,
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    login: (user) => dispatch(login(user))
  };
}

LoginForm = withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(LoginForm));

export default LoginForm;