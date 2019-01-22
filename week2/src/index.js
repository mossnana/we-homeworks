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
    this.n.current.value = "";
  }

  render() {
    return (
      <div className="container">
        <form className="form-inline">
          <div className="form-group mb-2">
            <label forHTML="plaintext" className="sr-only">Plaintext</label>
            <input type="text" className="form-control" name="plaintext" ref={this.plainText} placeholder="Plaintext" />
          </div>
          <div className="form-group mx-sm-3 mb-2">
            <label forHTML="n-key" className="sr-only">n key</label>
            <input type="text" className="form-control" name="n-key" ref={this.n} placeholder="n-key" />
          </div>
          <button type="submit" onClick={this.handleClick} className="btn btn-primary mb-2">Cipher It</button>
        </form>
        <input type="text" readonly className="form-control-plaintext" ref={this.result} placeHolder="Result" />
      </div>
    );
  }
}

render(<App />, document.getElementById('root'));
