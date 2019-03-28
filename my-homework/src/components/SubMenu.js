import React from "react";
import { Link } from "react-router-dom";

const SubMenu = () => {
  return (
    <div className="hero-foot">
      <nav className="tabs is-boxed is-fullwidth">
        <div className="container">
          <ul>
            <li>
              <Link to="/">Basic React</Link>
            </li>
            <li>
              <Link to="/pas">Prop & State</Link>
            </li>
            <li>
              <Link to="/api">APIs</Link>
            </li>
            <li>
              <Link to="/redux">Redux</Link>
            </li>
            <li>
              <Link to="/context">Context</Link>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  );
};

export default SubMenu;
