import React, { Component } from 'react';
// import Header from './header'
import LikeButton from './LikeButton'
import Profile from './Profile'

class App extends Component {
  constructor(props){
    super(props)

    this.state = {
      likeMe: 0,
      showButton: true
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(){
      this.setState(function(prevState){
        return{
          likeMe : prevState.likeMe + 1
        }
      })
  }

  componentWillMount(){
    console.log('App: WillMount')
  }

  componentDidMount(){
      console.log('App: DidMount')
  }

  render() {
    console.log('App: render')
    return (
      <div className="App">
        <h1>React Lifecycle</h1>
        <Profile like={this.state.likeMe} hideButton={this.setHideButton}/>
        {this.state.showButton && <LikeButton onClickLike={this.handleClick} like={true} />}
      </div>
    );
  }

  setHideButton=()=>{
    this.setState((prevState) => {
      return{
        showButton : false
      }
    })
  }
}

export default App;
