import { connect } from 'react-redux';
import { ON_CLICK, onClick } from './../actions';
import Button from './../components/Button';

function mapState(state, ownProps) {
  return {
    number: ownProps.number
  };
}

function mapDispatch(dispatch, ownProps) {
  return {
    onClick: () => dispatch(onClick(ownProps.number))
  };
}

const ButtonContainer = connect(
  mapState,
  mapDispatch
)(Button);

export default ButtonContainer;