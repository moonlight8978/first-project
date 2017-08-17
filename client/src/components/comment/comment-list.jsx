import React from 'react';

import Comment from './comment';

class CommentList extends React.Component {
  render() {
    const { comments } = this.props;
    let rows; 
    if (comments.length) {
      rows = comments.map((comment) => <Comment key={comment.id} comment={comment} />);
    } else {
      rows = <span>コメントはありません。</span>
    }
    
    return (
      <div>
        {rows}
      </div>
    );
  }
}

export default CommentList;