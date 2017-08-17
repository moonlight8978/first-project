const initialState = {
  loading: true,
  novel: null,
  id: null,
  error: null,
  status: null,
}

export default function novelReducer(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_NOVEL':
      return initialState;
      break;
    case 'FETCH_NOVEL_SUCCESS':
      return Object.assign({}, state, { novel: action.novel, loading: action.loading, error: null, status: null });
      break;
    case 'FETCH_NOVEL_FAILURE':
      return Object.assign(
        {}, 
        state, 
        { error: action.error, 
          loading: action.loading, 
          status: action.status,
          novel: null, },
      );
      break;
    case 'NOVEL_ROUTE_CHANGING':
      return initialState;
    default:
      return state;
  }
}