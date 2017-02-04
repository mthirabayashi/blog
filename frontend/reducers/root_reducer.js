import {combineReducers} from 'redux';
import SessionReducer from './session_reducer';
// import PostsReducer from './posts_reducer';
// import UsersReducer from './users_reducer';
// import ErrorsReducer from './errors_reducer';
// import SearchesReducer from './searches_reducer';

const RootReducer = combineReducers({
  session: SessionReducer
});

export default RootReducer;
