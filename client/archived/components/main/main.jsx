import React from 'react';
import { Route } from 'react-router-dom';

import NovelList from './../novel/list';
import NovelDetail from './../novel/detail';

class Main extends React.Component {
  render() {
    return (
      <div>
        {/* <Route exact path="/" component={Home} /> */}
        <Route exact path="/novels" component={NovelList} />
        <Route path="/novels/:id" component={NovelDetail} />
      </div>
    );
  }
}

export default Main;