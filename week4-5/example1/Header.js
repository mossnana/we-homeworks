import React, { Component } from 'react';

class header extends Component {
  render() {
    return (
      <h1>Hello World! ... {this.props.title} {this.props.x} {console.log(this.props.x)}</h1>
    );
  }
}

export default header;
