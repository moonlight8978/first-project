import React from 'react';

import { connect } from 'react-redux';

import { resetStore } from './../actions';
import ButtonContainer from './../containers/ButtonContainer';

class Home extends React.Component {
  render() {
    return (
      <div>
        <ButtonContainer number="1" />
        <ButtonContainer number="2" />
        <div>{this.props.clicked}</div>
        <button onClick={this.props.reset}>Reset store</button>
      </div>
    );
  }
}

function mapState(state, ownProps) {
  return {
    clicked: state.clicked
  };
}

function mapDispatch(dispatch, ownProps) {
  return {
    reset: () => dispatch(resetStore())
  };
}

Home = connect(
  mapState,
  mapDispatch
)(Home);

export default Home;