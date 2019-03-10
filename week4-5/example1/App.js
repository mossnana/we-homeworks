import React, { Component } from 'react';
import Header from './header'
import LikeButton from './LikeButton'

class App extends Component {
  constructor(props){
    super(props)

    this.state = {
      counter : 0,
      disLike : 0
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(like){
    if(like){
      this.setState(function(prevState){
        return{
          counter : prevState.counter + 1
        }
      })
    }
    else{
      this.setState(function(prevState){
        return{
          disLike : prevState.disLike + 1
        }
      })
    }
  }

  render() {
    const x = 'Aurawan'
    return (
      <div className="App">
        <Header title={"Hello"} x={x}/>
        <button onClick={this.handleClick}>Click me!</button>
        <p>Total click : {this.state.counter}</p>
        <p>disLike : {this.state.disLike}</p>
        <LikeButton onClickLike={this.handleClick} like={true} /> &nbsp;
        <LikeButton onClickLike={this.handleClick} />
      </div>
    );
  }
}

export default App;
