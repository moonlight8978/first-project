import { connect } from 'react-redux';

import Home from './../components/Home';

function mapState(state, ownProps) {
  return {
    clicked: state.clicked
  };
}

function mapDispatch(dispatch, ownProps) {
  return {};
}

const AppContainer = connect(
  mapState,
  mapDispatch
)(Home);

export default AppContainer;