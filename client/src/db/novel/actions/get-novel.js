import { getNovel } from './../api';

function fetchNovel(id) {
  return async (dispatch) => {
    dispatch(fetchingNovel(id));
    
    try {
      const response = await getNovel(id);
      console.log(response);
      return dispatch(fetchNovelSuccess(response.data));
    } catch (error) {
      console.log(error);
      console.log(error.response);
      return dispatch(fetchNovelFailure(error.response));
    }
  };
}

function fetchingNovel(id) {
  return {
    type: 'FETCH_NOVEL',
    id: id,
    loading: true,
  };
}

function fetchNovelSuccess(novel) {
  return {
    type: 'FETCH_NOVEL_SUCCESS',
    novel: novel,
    loading: false,
  };
}

function fetchNovelFailure(error) {
  return {
    type: 'FETCH_NOVEL_FAILURE',
    error: error.statusText,
    loading: false,
    status: error.status,
  }
}

export default fetchNovel;