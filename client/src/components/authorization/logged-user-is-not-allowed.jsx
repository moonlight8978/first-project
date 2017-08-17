import React from 'react';

import { Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import { Forbidden } from 'components/error';

function LoggedUserIsNotAllowed(WrappedComponent) {
  class WithoutAuthorization extends React.Component {
    // Avoid rendering Forbidden while user successfully login and redirect
    shouldComponentUpdate(nextProps, nextState) {
      return nextProps.loginSuccess ? false : true;
    }
    
    render() {
      const { user, loginSuccess, ...rest } = this.props;
      
      if (!user) {
        return <WrappedComponent {...rest} />;
      } else {
        return <Forbidden />;
      }
    }
  };
  
  function mapStateToProps(state) {
    return {
      user: state.auth.user,
      loginSuccess: state.login.success,
    }
  }
  
  function mapDispatchToProps(dispatch) {
    return {};
  }
  
  return connect(
    mapStateToProps,
    mapDispatchToProps,
  )(WithoutAuthorization);
}

export default LoggedUserIsNotAllowed;