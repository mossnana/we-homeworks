import React, { Component } from "react";
import { Link } from "react-router-dom";
import FacebookLogin from "react-facebook-login";
import "../css/login.css";
import "../css/util.css";

class Login extends Component {
  state = {
    userId: "",
    name: "",
    email: "",
    pictureUrl: "",
    login: false
  };

  responseFacebook = res => {
    console.log(res);
    this.setState({
      userId: res.userID,
      name: res.name,
      email: res.email,
      pictureUrl: res.picture != null ? res.picture.data.url : "",
      login: true
    });
  };

  clickLogin = e => {};

  render() {
    let fbContent;

    if (this.state.login) {
      fbContent = (
        <div
          style={{
            width: "400px",
            margin: "auto",
            padding: "20px"
          }}
        >
          <div className="wrap-input100">
            <img src={this.state.pictureUrl} alt={this.state.name} />
          </div>
          <div className="p-t-31 p-b-9">
            <span className="txt1">Username</span>
          </div>
          <div
            className="wrap-input100 validate-input"
            style={{ fontSize: "20px" }}
          >
            {this.state.name}
            <span className="focus-input100" />
          </div>
          <div className="p-t-31 p-b-9">
            <span className="txt1">Email</span>
          </div>
          <div
            className="wrap-input100 validate-input"
            style={{ fontSize: "20px" }}
          >
            {this.state.email}
            <span className="focus-input100" />
          </div>
        </div>
      );
    } else {
      fbContent = (
        <FacebookLogin
          appId="241068890074264"
          autoLoad={true}
          fields="name,email,picture"
          onClick={this.clickLogin}
          callback={this.responseFacebook}
        />
      );
    }
    return (
      <div className="limiter">
        <div className="container-login100">
          <div className="wrap-login100 p-l-110 p-r-110 p-t-60 p-b-60">
            <form className="login100-form validate-form flex-sb flex-w">
              <span className="login100-form-title">{fbContent}</span>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
