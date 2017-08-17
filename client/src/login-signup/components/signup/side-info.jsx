import React from 'react';

class SideInfo extends React.Component {
  constructor() {
    super();
  }
  
  render() {
    
    return (
      <div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-id-card" />
          </span>
          <input type="text" className="form-control" id placeholder="Lastname" ng-model="vm.signup.user.lastName" />
        </div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-id-card" />
          </span>
          <input 
            type="text" 
            className="form-control" 
            placeholder="Middlename" 
          />
        </div>
        <div className="form-group">
          <span className="icon-wrap">
            <i className="fa fa-fw fa-id-card" />
          </span>
          <input 
            type="text" 
            className="form-control" 
            placeholder="Firstname"
          />
        </div>
        <div className="row">
          <div className="col-lg-7 col-xl-8">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-phone" />
              </span>
              <input 
                type="text" 
                className="form-control"
                placeholder="Phone number"
              />
            </div>
          </div>
          <div className="col-lg-5 col-xl-4">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-birthday-cake" />
              </span>
              <input type="text" className="form-control" />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-lg-7 col-xl-8">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-location-arrow" />
              </span>
              <input 
                type="text" 
                className="form-control" 
                placeholder="Address" 
              />
            </div>
          </div>
          <div className="col-lg-5 col-xl-4">
            <div className="form-group">
              <span className="icon-wrap">
                <i className="fa fa-fw fa-map-marker" />
              </span>
              <select className="form-control">
                <option value>-</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default SideInfo;