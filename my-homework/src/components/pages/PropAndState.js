import React, { Component } from "react";
import Card from "../Card";

class PropAndState extends Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "This is Title State from PropAndState Component",
      subtitle: "@mossnana",
      link: "https://github.com/mossnana",
      img:
        "https://www.tlcthai.com/education/wp-content/uploads/2017/09/saturday-m2.png",
      content: "Content is King",
      img2: "https://pngicon.ru/file/uploads/viber.png"
    };
  }

  render() {
    return <Card stateToProp={this.state} />;
  }
}

export default PropAndState;
