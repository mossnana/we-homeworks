import React, { Component } from "react";
import firebase from "../Firebase";
import { Link } from "react-router-dom";

class Show extends Component {
  constructor(props) {
    super(props);
    this.state = {
      myshop: {},
      key: ""
    };
  }

  componentDidMount() {
    const ref = firebase
      .firestore()
      .collection("myshop")
      .doc(this.props.match.params.id);
    ref
      .get()
      .then(doc => {
        if (doc.exists) {
          this.setState({
            myshop: doc.data(),
            key: doc.id,
            isLoading: false
          });
        } else {
          console.log("No such document!");
        }
      })
      .then(resolve => {
        console.log(this.state, resolve);
      });
  }

  delete(id) {
    firebase
      .firestore()
      .collection("myshop")
      .doc(id)
      .delete()
      .then(() => {
        console.log("Document successfully deleted!");
        this.props.history.push("/");
      })
      .catch(error => {
        console.error("Error removing document: ", error);
      });
  }

  render() {
    return (
      <div className="container mt-5">
        <div className="d-flex justify-content-start">
          <a className="btn btn-light">
            <Link to="/">กลับไปหน้าหลัก</Link>
          </a>
        </div>
        <div className="panel panel-default">
          <div className="panel-heading">
            <br />
            <h3 className="panel-title text-center">
              {this.state.myshop.name}
            </h3>
          </div>
          <div className="panel-body text-center">
            <dl>
              <dt>รายละเอียดสินค้า: </dt>
              <dd>{this.state.myshop.description}</dd>
              <dt>ราคา: </dt>
              <dd>{this.state.myshop.price}</dd>
              <dt>ประเภทสินค้า: </dt>
              <dd>{this.state.myshop.category}</dd>
            </dl>
            <Link to={`/edit/${this.state.key}`} className="btn btn-success">
              แก้ไขสินค้า
            </Link>
            &nbsp;
            <button
              onClick={this.delete.bind(this, this.state.key)}
              className="btn btn-danger"
            >
              ลบสินค้า
            </button>
          </div>
        </div>
      </div>
    );
  }
}

export default Show;
