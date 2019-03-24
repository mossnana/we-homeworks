import React, {Component} from 'react'
import {BtnColorContext} from './App'

class ThemedButton extends Component {
  render(){
    return (
      <BtnColorContext.Consumer>
        {BtnColor =>
          <button className={BtnColor}>
            Hello {BtnColor}
          </button>
        }
      </BtnColorContext.Consumer>
    )
  }
}

export default ThemedButton
