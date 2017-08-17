import React from 'react';

import { 
  TabContent, TabPane, Nav, NavItem, NavLink, Card, Button, CardTitle, 
  CardText, Row, Col 
} from 'reactstrap';

import MainInfo from './main-info';
import SideInfo from './side-info';

class SignupForm extends React.Component {
  constructor() {
    super();

    this.toggle = this.toggle.bind(this);
    // this.userNameOnchange = this.userNameOnchange.bind(this);
    // this.emailOnchange = this.emailOnchange.bind(this);
    // this.passwordOnchange = this.passwordOnchange.bind(this);
    // this.passwordConfirmationOnchange = this.passwordConfirmationOnchange.bind(this);
    // this.acceptTOSOnchange = this.acceptTOSOnchange.bind(this);
    // this.showPasswordOnchange = this.showPasswordOnchange.bind(this);
    // this.nameOnchange = this.nameOnchange.bind(this);
    // this.namePronounceOnchange = this.namePronounceOnchange.bind(this);
    // this.phoneNumberOnchange = this.phoneNumberOnchange.bind(this);
    // this.birthdayOnchange = this.birthdayOnchange.bind(this);
    // this.addressOnchange = this.addressOnchange.bind(this);
    // this.countryOnchange = this.countryOnchange.bind(this);
    this.handleChange = this.handleChange.bind(this);
    
    this.state = {
      activeTab: '1',
      
      userName: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      acceptTOS: false,
      showPassword: false,
      name: '',
      namePronounce: '',
      phoneNumber: '',
      birthday: '',
      address: '',
      country: '',
    }
  }
  
  handleChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;
    
    this.setState({
      [name]: value
    });
  }
  
  // userNameOnchange(e) {
  //   this.setState({
  //     userName: e.target.value
  //   });
  // }
  // 
  // emailOnchange(e) {
  //   this.setState({
  //     email: e.target.value
  //   });
  // }
  // 
  // passwordOnchange(e) {
  //   this.setState({
  //     password: e.target.value
  //   });
  // }
  // 
  // passwordConfirmationOnchange(e) {
  //   this.setState({
  //     passwordConfirmation: e.target.value
  //   });
  // }
  // 
  // acceptTOSOnchange(e) {
  //   this.setState({
  //     acceptTOS: e.target.value
  //   });
  // }
  // 
  // showPasswordOnchange(e) {
  //   this.setState({
  //     showPassword: e.target.value
  //   });
  // }
  // 
  // nameOnchange(e) {
  //   this.setState({
  //     name: e.target.value
  //   });
  // }
  // 
  // namePronounceOnchange(e) {
  //   this.setState({
  //     namePronounce: e.target.value
  //   });
  // }
  // 
  // phoneNumberOnchange(e) {
  //   this.setState({
  //     phoneNumber: e.target.value
  //   });
  // }
  // 
  // birthdayOnchange(e) {
  //   this.setState({
  //     birthday: e.target.value
  //   });
  // }
  // 
  // addressOnchange(e) {
  //   this.setState({
  //     address: e.target.value
  //   });
  // }
  // 
  // 
  // countryOnchange(e) {
  //   this.setState({
  //     country: e.target.value
  //   });
  // }
  
  toggle(tab) {
    if (this.state.activeTab !== tab) {
      this.setState({
        activeTab: tab
      });
    }
  }
  
  render() {
    const { 
      userName, email, password, passwordConfirmation, acceptTOS, showPassword, 
      name, namePronounce, phoneNumber, birthday, address, country,
    } = this.state;
    
    return (
      <form>
        <Nav tabs className="form-title-group no-padding">
          <NavItem className="form-title">
            <NavLink
              className={this.state.activeTab === '1' ? 'active' : ''}
              onClick={() => { this.toggle('1'); }}
            >
              強制情報
            </NavLink>
          </NavItem>
          <NavItem className="form-title">
            <NavLink
              className={this.state.activeTab === '2' ? 'active' : ''}
              onClick={() => { this.toggle('2'); }}
            >
              他の情報
            </NavLink>
          </NavItem>
        </Nav>
        <TabContent activeTab={this.state.activeTab}>
          <TabPane tabId="1" className="fade">
            <MainInfo 
              userName={userName}
              email={email}
              password={password}
              passwordConfirmation={passwordConfirmation}
              showPassword={showPassword}
              handleChange={this.handleChange}
            />
          </TabPane>
          <TabPane tabId="2" className="fade">
            <SideInfo 
              name={name}
              namePronounce={namePronounce}
              phoneNumber={phoneNumber}
              birthday={birthday}
              address={address}
              country={country}
            />
          </TabPane>
        </TabContent>
        <div className="form-check tos">
          <label className="form-check-label">
            <input type="checkbox" className="form-check-input" ng-model="vm.signup.user.acceptTOS" required />
            Accept TOS
          </label>
        </div>
        {/* <div className="form-error animated fadeIn no-ng-animate" ng-if="vm.signup.error">
          <span ng-repeat="(key, value) in vm.signup.error">{{ value }}<br /></span>
          </div>
          <div className="form-success animated fadeIn no-ng-animate" ng-if="vm.signup.message">
          <span>{{ vm.signup.message }}</span>
        </div> */}
        <div className="form-submit">
          <button className="btn-c btn-c-5 btn-c-5-dark">
            サインアップ
          </button>
        </div>
        {/* END wrapper */}
        {/* END form content */}
      </form>
    );
  }
}

export default SignupForm;