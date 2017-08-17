import React from 'react';

import { withRouter } from 'react-router-dom';
import { connect } from 'react-redux';

import { 
  authenticate,
  authTokenExpirationCheck,
} from './actions';

class Authentication extends React.Component {
  componentDidMount() {
    const { history, authenticate, authTokenExpirationCheck } = this.props;
    
    history.listen((_location, _action) => {
      localStorage.auth && authTokenExpirationCheck();
    });
    
    if (localStorage.auth) {
      // request to server to validate token
      authenticate(true);
    }
  }
  
  render() {
    return null;
  }
}

function mapStateToProps(state, ownProps) {
  console.log(state);
  return {
    isAuthenticated: state.auth.isAuthenticated
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    authenticate: (isAuthenticated) => dispatch(authenticate(isAuthenticated)),
    authTokenExpirationCheck: () => dispatch(authTokenExpirationCheck()),
  };
}

Authentication = withRouter(connect(
  mapStateToProps, 
  mapDispatchToProps
)(Authentication));

export default Authentication;