import React from 'react';

import { Route, Switch, withRouter } from 'react-router-dom';
import { TransitionGroup, CSSTransition } from 'react-transition-group';

import LoginSignup from 'login-signup';
import Home from 'home';

function Routes(props) {
  return (
    <TransitionGroup>
      <CSSTransition 
        key={props.location.pathname.split('/')[1]} 
        timeout={500}
        classNames="fade"
        // classNames={{
        //   appear: 'animated',
        //   appearActive: 'my-active-appear',
        //   enter: 'animated',
        //   enterActive: 'fadeIn',
        //   exit: 'animated',
        //   exitActive: 'fadeOut',
        // }}
      >
        <Switch location={props.location}>
          <Route exact path="/" component={Home} />
          <Route path="/login" component={LoginSignup} />
        </Switch>
      </CSSTransition>
    </TransitionGroup>
  );
}

Routes = withRouter(Routes);

export default Routes;