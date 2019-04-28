import React, { Component, Fragment } from "react";
import { Link } from "react-router-dom";
import Fade from "react-reveal/Fade";
import ReactResizeDetector from "react-resize-detector";

class Navbar extends Component {
  state = {
    responsive: false
  };

  showMenu = e => {
    e.preventDefault();
    console.log(window.innerHeight);
    if (this.state.responsive === true) {
      this.setState({
        responsive: false
      });
    } else {
      this.setState({
        responsive: true
      });
    }
  };

  onResize = e => {
    console.log(e);
    if (e > 1087) {
      this.setState({
        responsive: false
      });
    }
  };

  render() {
    return (
      <Fragment>
        <ReactResizeDetector handleWidth onResize={this.onResize} />
        <nav className="navbar" role="navigation" aria-label="main navigation">
          <div className="navbar-brand">
            <Link to="/" className="navbar-item">
              <img
                src="https://vignette.wikia.nocookie.net/yunas-princess-adventure/images/f/f9/Infinity_Gauntlet.png"
                width="30"
                height="300"
              />
            </Link>
          </div>
          <a
            role="button"
            className="navbar-burger burger"
            onClick={this.showMenu}
          >
            <span aria-hidden="true" />
            <span aria-hidden="true" />
            <span aria-hidden="true" />
          </a>

          <div className="navbar-menu">
            <div className="navbar-start">
              <Link to="/" className="navbar-item">
                หน้าหลัก
              </Link>
              <a
                className="navbar-item"
                href="https://github.com/mossnana/we-dpu/tree/WE532-Web-Security-and-Information-System-Security/facebook-homework"
              >
                Source Code
              </a>
            </div>

            <div className="navbar-end">
              <div className="navbar-item">
                <div className="buttons">
                  <a className="button is-primary">
                    <strong className="text-white">
                      <Link to="/login">Login</Link>
                    </strong>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </nav>
        {this.state.responsive && window.innerHeight < 1088 && (
          <Fade top>
            <aside className="menu">
              <p className="menu-label">General</p>
              <ul className="menu-list">
                <li>
                  <Link to="/" className="navbar-item">
                    หน้าหลัก
                  </Link>
                  <a
                    className="navbar-item"
                    href="https://github.com/mossnana/we-dpu/tree/WE532-Web-Security-and-Information-System-Security/facebook-homework"
                  >
                    Source Code
                  </a>
                </li>
              </ul>
              <p className="menu-label">Member Menu</p>
              <ul className="menu-list">
                <li>
                  <Link to="/login">Login</Link>
                </li>
              </ul>
            </aside>
          </Fade>
        )}
      </Fragment>
    );
  }
}

export default Navbar;
