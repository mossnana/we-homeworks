import React, { Component } from 'react';
import {Link} from 'react-router-dom'

class Header extends Component{
  render(){
    return(
      <div>
        {/* Navbar */}
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <a class="navbar-brand" href="#">React VS Bootstrap</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              {this.props.children}
            </ul>
          </div>
        </nav>
      </div>
    )
  }
}
export default Header
