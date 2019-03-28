import React, { Component } from "react";
import Card from "./Card";

class Content extends Component {
  render() {
    return (
      <div className="columns">
        <div class="column is-three-fifths is-offset-one-fifth">
          {this.props.children}
        </div>
      </div>
    );
  }
}

export default Content;
