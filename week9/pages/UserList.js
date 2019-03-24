import React, { Component } from 'react';
import UserList from '../components/user/UserList'

class User extends Component{
  state = {
    data: null,
    err: null
  }

  componentDidMount(){
    fetch('https://jsonplaceholder.typicode.com/users') .then(res => {
      if(res.ok){
        return res
      }
      throw Error(res.status)})
      .then(result => result.json())
      .then(result => this.setState({ data: result }))
      .catch(e => this.setState({ err: e.message }))
    }

    render(){
      const { data, err } = this.state
      let list = <div>Loading...</div>
      if(data){
        if(data.length > 0){
          list = <UserList data={data} />
        }
        else {
          list = <h4>No Data</h4>
        }
      }
      if(err){
        list = <h4>Error: {err}</h4>
      }
      return(
        <div>
        <h1>User</h1>
        {list}
        </div>
      )
    }
  }

  export default User
