import React, { Component } from "react";
import Header from "./components/Header";
import Content from "./components/Content";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import SubMenu from "./components/SubMenu";
import BasicReact from "./components/pages/BasicReact";
import PropAndState from "./components/pages/PropAndState";
import Api from "./components/pages/Api";
import Redux from "./components/pages/Redux";
import Context from "./components/pages/Context";
import { Route } from "react-router-dom";
import { connect } from "react-redux";

import "./App.css";

class App extends Component {
  constructor() {
    super();
    this.state = {};
  }

  render() {
    return (
      <div className="fontMali">
        <Navbar />
        <Header>
          <SubMenu />
        </Header>
        <br />
        <Content>
          <Route path="/" exact component={BasicReact} />
          <Route path="/pas" component={PropAndState} />
          <Route path="/api" component={Api} />
          <Route path="/redux" component={Redux} />
          <Route path="/context" component={Context} />
        </Content>
        <br />
        <Footer />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  counter: state.counter
});

const mapDispatchToProps = dispatch => ({
  increment: () =>
    dispatch({
      type: Action.INCREMENT,
      text: "INCREMENT"
    }),
  decrement: () =>
    dispatch({
      type: Action.DECREMENT,
      text: "DECREMENT"
    })
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(App);
