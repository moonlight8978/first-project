import React from 'react';

import NovelApi from './../../api/novel';

class NovelDetail extends React.Component {
  constructor() {
    super();
    this.state = {
      done: false,
      novel: {},
    }
  }
  
  async componentDidMount() {
    const novel = await new NovelApi().get({ id: this.props.match.params.id });
    this.setState({
      novel: novel,
      done: true,
    });
  }
  
  componentWillUnmount() {
  }
  
  render() {
    if (this.state.done) {
      return <div>This is novel {this.props.match.params.id}</div>;
    } else {
      return <div>Loading...</div>;
    }
    
  }
}

export default NovelDetail;