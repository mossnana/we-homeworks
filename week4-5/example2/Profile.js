import React, { Component } from 'react'

class Profile extends Component{
  componentDidMount(){
    console.log('Profile: componentDidMount')
  }

  componentWillReceiveProps(nextProps){
    if(nextProps.like === 2 && this.props.like < 2){
      this.props.hideButton()
    }
	   console.log('Profile: componentWillReceiveProps ' + nextProps.like + ' , ' +  this.props.like )
  }

  shouldComponentUpdate(nextProps, nextState){
    console.log('Profile: shouldComponentUpdate')
    return true
  }

	componentWillUpdate(nextProps, nextState){
    console.log('Profile: componentWillUpdate ' + nextProps.like + ' , ' +  this.props.like)
  }

	componentDidUpdate(nextProps, nextState){
    console.log('Profile: componentDidUpdate ' + nextProps.like + ' , ' +  this.props.like)
  }

  render() {
      console.log('Profile: render')
      return(
        <div>
          <h2>Like: {this.props.like}</h2>
        </div>
      )
    }
  }

  export default Profile;
