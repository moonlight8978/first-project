import React from 'react';

const CommentAuth = function(WrappedComponent, show) {
  return class extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        show: 0
      }
    }
    
    render() {
      if (show && this.state) {
        return <WrappedComponent {...this.props} show={show} />;
      } else {
        return <div>Hide!</div>
      }
    }
  }
}

class Comment extends React.Component {
  render() {
    const { comment } = this.props;
    
    return <div>{comment.body}</div>;
  }
}

Comment = CommentAuth(Comment, 0);

export default Comment;