```javascript

```
## Redux

1. สร้าง **store** ใน **index.js**
```javascript
import {createStore} from 'redux'
import {Provider} from 'react-redux'
```
2. สร้าง reducers/counters.js เพื่อเป็น function ของ reducers รับ state และ action
```javascript
import Action from '../actions'
var initialState = {
  couter: 0,
  text: ""
}

function counterReducer(state = initialState, action) {
  switch (action.type) {
    case Action.INCREMENT:
      return {
        couter: state.couter + 1,
        text: action.text
      }
    case Action.DECREMENT:
      return {
        couter: state.couter - 1,
        text: action.text
      }
    default:
      return state
  }
}

export default counterReducer;
```

3. สร้าง reducers/index.js
