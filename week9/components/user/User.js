import React, { Component } from 'react';
class User extends Component{
  render(){
    const { data } = this.props
    return(
      <h3>
        {data.name} ({data.email})
      </h3>
    )
  }
}
export default User
