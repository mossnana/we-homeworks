import React, { Component } from "react";
import { Link } from "react-router-dom";
import "../css/login.css";
import "../css/util.css";

class Main extends Component {
  render() {
    return (
      <div className="limiter">
        <div className="container-login100">
          <div className="wrap-login100 p-l-110 p-r-110 p-t-60 p-b-60">
            <form className="login100-form validate-form flex-sb flex-w">
              <span className="login100-form-title">Hello World !!!!</span>
              <Link to="/login" className="login100-form-title">
                Click Here
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default Main;
