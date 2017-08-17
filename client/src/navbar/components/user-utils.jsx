import React from 'react';

import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { logout } from './../actions'; 

class UserUtils extends React.Component {
  constructor() {
    super();
    this.logout = this.logout.bind(this);
  }
  
  logout(event) {
    event.preventDefault();
    this.props.logout();
  }
  
  render() {
    const { isAuthenticated } = this.props;
    const _guest = (
      <li className="nav-item">
        <Link to="/login" className="nav-link">
          ログイン
        </Link>
      </li>
    );
    const _user = (    
      <li className="nav-item">
        <a href="#" onClick={this.logout} className="nav-link">
          ログアウト
        </a>
      </li>
    );
    
    return (
      <div className="-user">
        <ul className="navbar-nav">
          { isAuthenticated ? _user : _guest }
          <li className="nav-item">
            <a className="nav-link">
              <i className="fa fa-shopping-cart" />
              0
            </a>
          </li>
        </ul>
      </div>
    );
  }
}

function mapStateToProps(state, ownProps) {
  return {
    isAuthenticated: state.auth.isAuthenticated,
    user: state.auth.user,
  }
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    logout: () => dispatch(logout())
  };
}

UserUtils = connect(
  mapStateToProps,
  mapDispatchToProps
)(UserUtils);

export default UserUtils;