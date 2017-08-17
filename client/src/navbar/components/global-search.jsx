import React from 'react';

import { Link } from 'react-router-dom';

export default function GlobalSearch() {
  return (
    <form className="form-inline search-form">
      <div className="input-group search-cate-wrap">
        {/* ng-class="{ 'has-danger': navSearchForm.$submitted && navSearchForm.category.$invalid }" */}

        <select className="form-control search-cate" name="category" required>
          <option value>カテゴリ</option>
          <option value="novel">ビジュアルノベル</option>
          <option value="novelRelease">ノベルの発売</option>
          <option value="album">アルバム</option>
          <option value="albumRelease">アルバムの発売</option>
          <option value="novelProduct">美少女ゲーム(製品)</option>
          <option value="albumProduct">アルバム(製品)</option>
          <option value="character">キュラクター</option>
          <option value="tag">タグ</option>
        </select>
      </div>
      <div className="input-group search-query-wrap">
        {/* ng-class="{ 'has-danger': navSearchForm.$submitted && navSearchForm.query.$invalid }" */}
        <input
          className="form-control search-query"
          name="query"
          type="text"
          placeholder="探しましょう"
          autoComplete="off"
          required 
        />
        <div className="btn-group">
          <button type="button" className="btn btn-clear">
            {/* <span>✖</span> */}
            <i className="fa fa-fw fa-times" />
          </button>
          <button className="btn btn-submit">
            <i className="fa fa-fw fa-search" />
          </button>
        </div>

        <div className="live-search-results">
        </div>
      </div>
    </form>
  );
}