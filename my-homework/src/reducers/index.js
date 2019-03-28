import { combineReducers } from "redux";
import counterReducer from "./counters";
export default combineReducers({
  counter: counterReducer
});
