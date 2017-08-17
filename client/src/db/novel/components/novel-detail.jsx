import React from 'react';

import { connect } from 'react-redux';

import { fetchNovel, routeChanging } from './../actions';
import CommentList from './../../../components/comment';

class NovelDetail extends React.Component {
  async componentDidMount() {
    console.log(this.props);
    await this.props.requestNovel(this.props.match.params.id);
    console.log(this.props);
  }
  
  async componentWillReceiveProps(nextProps) {
    if (this.props.match.params.id != nextProps.match.params.id) {
      // nextProps.routeChanging();
      await nextProps.requestNovel(nextProps.match.params.id);
      console.log(nextProps);
    }
  }
  
  render() {
    if (this.props.loading) {
      return <div>Loading...</div>;
    } else {
      const content = this.props.error || this.props.novel.title
      return (
        <div>
          <h1>This is novel detail site</h1>
          <span>{ content }</span>
          <div>
            {this.props.novel && <CommentList comments={this.props.novel.reviews} />}
          </div>
        </div>
      );
    }
  } 
}

function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading,
    novel: state.novel,
    id: state.id,
    error: state.error,
    status: state.status,
  };
}

function mapDispatchToProps(dispatch, ownProps) {
  return {
    requestNovel: (id) => dispatch(fetchNovel(id)),
    routeChanging: () => dispatch(routeChanging()),
  };
}

NovelDetail = connect(
  mapStateToProps,
  mapDispatchToProps,
)(NovelDetail);


export default NovelDetail;