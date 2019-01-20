import React, { Component } from 'react';
import { render } from 'react-dom';
import './style.css';

class App extends Component {
  constructor() {
    super();
    this.plainText = React.createRef();
    this.n = React.createRef();
    this.result = React.createRef();
  }
  
  handleClick = (e) => {
    e.preventDefault();
    console.log(e.target.value);
    this.ccFunc(this.plainText.current.value);
  }

  ccFunc = (plainText) => {
    var abc = ("abcdefghijklmnopqrstuvwxyz").split("");
    var plainText = plainText.split("");
    var cipherText = [];
    var cipherResult = []
    var n = parseInt(this.n.current.value);
    for(var i=0; i<plainText.length; i++) {
      if(abc.indexOf(plainText[i]) !== -1) {
        var position = abc.indexOf(plainText[i]);
        cipherText[i] = ((position+n) % 26);
      } else if(plainText[i] === " ") {
        cipherText[i] = " ";
      } else {
        cipherText[i] = plainText[i];
      }
      cipherResult = cipherText.map(letterNumber => {
          if(abc[letterNumber]) {
            return abc[letterNumber];
          } else {
            return " ";
          }
      });
    }
    cipherResult = cipherResult.join("");
    this.result.current.value = cipherResult;
  }

  render() {
    return (
      <div className="container">
        <input type="text" ref={this.plainText} placeHolder="Plain text" />
        <br />
        <input type="text" ref={this.n} placeHolder="n" />
        <br />
        <button onClick={this.handleClick}>Cipher It</button>
        <br />
        <input type="text" ref={this.result} placeHolder="result" />
      </div>
    );
  }
}

render(<App />, document.getElementById('root'));
