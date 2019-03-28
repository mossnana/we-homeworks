import React from "react";

const Header = props => {
  return (
    <section className="hero is-medium is-primary is-bold">
      <div className="hero-body">
        <div className="container">
          <h1 className="title">กาลครั้งหนึ่ง ....</h1>
          <h2 className="subtitle">แค่คิดถึงอยู่ในใจ</h2>
        </div>
      </div>
      {props.children}
    </section>
  );
};

export default Header;
