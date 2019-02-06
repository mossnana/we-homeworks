import React, { Component } from "react";
import { Link } from "react-router-dom";
import "./styles.css";
import firebase from "./Firebase";

class App extends Component {
  constructor(props) {
    super(props);
    // reference to database collection in firestone -> myshop
    this.ref = firebase.firestore().collection("myshop");
    // unsubscribe -> allows the client to stop using bandwidth to receive updates
    this.unsubscribe = null;
    // college products as array -> this.state.myshop[products details]
    this.state = {
      myshop: []
    };
  }

  // Insert Data Function
  onCollectionUpdate = querySnapshot => {
    // querySnapshot -> Received querySnapshot variable as object
    console.log(querySnapshot);
    // my shop array -> college data form input
    const myshop = [];
    // Take each data push to array
    querySnapshot.forEach(doc => {
      const { name, description, price, category } = doc.data();
      myshop.push({
        key: doc.id,
        doc, // DocumentSnapshot
        name,
        description,
        price,
        category
      });
    });
    // set state as myshop array to display
    this.setState({
      myshop
    });
  };

  // Updated Component after render and set state methods
  componentDidMount() {
    this.unsubscribe = this.ref.onSnapshot(this.onCollectionUpdate);
  }

  render() {
    return (
      <div className="container mt-5">
        <div className="d-flex justify-content-end">
          <a className="btn btn-light">
            <Link to="/create">เพิ่มสินค้า</Link>
          </a>
        </div>
        <div className="panel panel-default text-center">
          <div className="panel-heading">
            <h3 className="panel-title">ตารางสินค้า</h3>
          </div>
          <br />
          <div className="panel-body">
            <table className="table table-stripe">
              <thead>
                <tr>
                  <th>ชื่อสินค้า</th>
                  <th>รายละเอียดสินค้า</th>
                  <th>ราคา</th>
                  <th>ประเภทสินค้า</th>
                </tr>
              </thead>
              <tbody>
                {this.state.myshop.map(myshop => (
                  <tr key={myshop.key}>
                    <td>
                      <Link to={`/show/${myshop.key}`}>{myshop.name}</Link>
                    </td>
                    <td>{myshop.description}</td>
                    <td>{myshop.price}</td>
                    <td>{myshop.category}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
