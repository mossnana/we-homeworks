// import React, { Component } from 'react';
//
// class LikeButton extends Component {
//   render(){
//     return(
//       <button onClick={this.handleClick}>{this.props.like ? 'Like Me' : 'DisLike Me'}</button>
//     )
//   }
//
//   handleClick=()=>{
//     this.props.onClickLike(this.props.like)
//   }
// }
//
// export default LikeButton;


import React from 'react'

const LikeButton = (props) => {
  return(
    <div>
      <button onClick={props.onClickLike}>{props.like ? 'Like Me' : 'DisLike Me'}</button>
    </div>
  )
}
export default LikeButton;
