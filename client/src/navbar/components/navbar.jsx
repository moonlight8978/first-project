import React from 'react';

import { Link } from 'react-router-dom';
import { Collapse, NavbarToggler } from 'reactstrap';
import $ from 'jquery';

import GlobalLink from './global-link';
import UserUtils from './user-utils';
import GlobalSearch from './global-search';

class Navbar extends React.Component {
  constructor() {
    super();
    
    this.toggle = this.toggle.bind(this);
    this.windowOnscroll = this.windowOnscroll.bind(this);
    this.state = {
      isOpen: false,
      timeout: null,
    };
  }
  
  windowOnscroll(event) {
    const ele = $(event.target);
    if (ele.scrollTop() == 0) {
      this.$nav.removeClass('active');
    } else {
      this.$nav.addClass('active');
    }
  }
  
  componentDidMount() {
    this.$nav = $(this.refs.nav);
    
    $(window).scroll(this.windowOnscroll);
    this.setState({
      timeout: setTimeout(() => {
        this.$nav.removeClass('d-none');
      }, 1000)
    });
  }
  
  componentWillUnmount() {
    clearTimeout(this.state.timeout);
    $(window).off('scroll', this.windowOnscroll);
  }
  
  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }
  
  render() {
    return (
      <nav className="navbar fixed-top navbar-inverse navbar-expand-md animated fadeInDown d-none" ref="nav">
        <NavbarToggler left onClick={this.toggle} />

        <div className="container">
          <Link to="/" className="navbar-brand d-md-none">にょろにょろ</Link>
          <Collapse isOpen={this.state.isOpen} navbar className="justify-content-between">
            {/* <div className="collapse navbar-collapse justify-content-between"> */}
            <div className="d-flex">
              <GlobalLink />
              <GlobalSearch />
            </div>
            <UserUtils />
            {/* </div> */}
          </Collapse>
        </div>
      </nav>
    );
  }
}

1;

export default Navbar;