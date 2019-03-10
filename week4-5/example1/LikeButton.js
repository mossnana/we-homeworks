import React, { Component } from 'react';

class LikeButton extends Component {
  render(){
    return(
      <button onClick={this.handleClick}>{this.props.like ? 'Like Me' : 'DisLike Me'}</button>
    )
  }

  handleClick=()=>{
    this.props.onClickLike(this.props.like)
  }
}

export default LikeButton;
