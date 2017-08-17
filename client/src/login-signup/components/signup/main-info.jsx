import React from 'react';

class MainInfo extends React.Component {
  constructor() {
    super();
  }
  
  render() {
    const { 
      userName, email, password, passwordConfirmation, showPassword,
      handleChange,
    } = this.props;
    const passwordType = showPassword ? 'text' : 'password';
    return (
      <div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-user" />
          </span>
          <input required
            name="userName"
            type="text" 
            className="form-control" 
            placeholder="Username" 
            value={userName}
            onChange={handleChange}
          />
        </div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-envelope" />
          </span>
          <input required 
            name="email"
            type="email" 
            className="form-control" 
            placeholder="Email" 
            value={email}
            onChange={handleChange}
          />
        </div>
        <div className="row">
          <div className="col-lg-6">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-lock" />
              </span>
              <input required
                name="password"
                type={passwordType}
                className="form-control"
                placeholder="Password" 
                value={password}
                onChange={handleChange}
              />
            </div>
          </div>

          <div className="col-lg-6">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-repeat" />
              </span>
              <input required 
                name="passwordConfirmation"
                type={passwordType}
                className="form-control" 
                placeholder="Password confirmation" 
                value={passwordConfirmation}
                onChange={handleChange}
              />
              <small id="fileHelp" className="form-text text-muted text-right">
                <div className="form-check">
                  <label className="form-check-label">
                    <input 
                      name="showPassword"
                      type="checkbox" 
                      className="form-check-input" 
                      checked={showPassword}
                      onChange={handleChange}
                    />
                    パスワードを表示する
                  </label>
                </div>
              </small>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default MainInfo;