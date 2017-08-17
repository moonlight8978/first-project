import React from 'react';

import { Link } from 'react-router-dom';

import './error.css';

class Error extends React.Component {
  render() {
    const { status, statusText, message } = this.props;
    
    const statusNumbers = status.toString().split('');
    
    return (
      <div className="page-wrap">
        <div className="container animated fadeIn">
          <div className="error-container">
            <div className="code">
              <div>
                {statusNumbers[0]}
              </div>
              <div>
                {statusNumbers[1]}
              </div>
              <div>
                {statusNumbers[2]}
              </div>
            </div>
            <div className="title">
              <div>error!</div>
              <div>
                {statusText}
              </div>
            </div>
            <p className="text">
              {message}
            </p>
            <div className="link row">
              <div className="col-6">
                <Link to="/">
                  <span>‹</span>
                  戻る
                </Link>
              </div>
              <div className="col-6">
                <Link to="/">
                  ホーム
                  <span>›</span>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Error;