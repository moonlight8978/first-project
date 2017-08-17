import React from 'react';

import { connect } from 'react-redux';

import { Forbidden, Unauthorized } from 'components/error';

function Authorization(WrappedComponent, highestAllowedRole) {
  class WithAuthorization extends React.Component {
    render() {
      const { user, ...rest } = this.props;
      
      if (highestAllowedRole && user) {
        if (user.roles.indexOf(highestAllowedRole) != -1) {
          return <WrappedComponent {...rest} />;
        } else {
          return <Forbidden />;
        }
        
      } else {
        return <Unauthorized />;
      }
    }
  };
  
  function mapStateToProps(state) {
    return {
      user: state.auth.user
    }
  }
  
  function mapDispatchToProps(dispatch) {
    return {};
  }
  
  return connect(
    mapStateToProps,
    mapDispatchToProps,
  )(WithAuthorization);
}

export default Authorization;