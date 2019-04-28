import React, { Component, Fragment } from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import Navbar from "./components/Navbar";
import Login from "./components/Login";
import Main from "./components/Main";
import "bulma";

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="container">
          <Navbar />
          <Switch>
            <Fragment>
              <Route exact path="/" component={Main} />
              <Route path="/login" component={Login} />
            </Fragment>
          </Switch>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
