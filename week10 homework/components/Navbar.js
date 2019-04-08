import React from "react";

const Navbar = () => {
  return (
    <nav className="navbar is-warning">
      <div className="container">
        <div className="navbar-brand">
          <a className="navbar-item" href="#">
            My Homework
          </a>
          <span className="navbar-burger burger" data-target="navMenu">
            <span />
            <span />
            <span />
          </span>
        </div>
        <div id="navMenu" className="navbar-menu">
          <div className="navbar-end">
            <a href="/" className="navbar-item is-active">
              Home
            </a>
            <a href="https://twitter.com/permpoonchao" className="navbar-item">
              Blog
            </a>
            <a href="https://mossnana.github.io/resume" className="navbar-item">
              About Me
            </a>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
