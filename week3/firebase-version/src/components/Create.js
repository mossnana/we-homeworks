import React, { Component } from "react";
import firebase from "../Firebase";
import { Link } from "react-router-dom";

class Create extends Component {
  constructor() {
    super();
    this.ref = firebase.firestore().collection("myshop");
    this.refCategory = firebase.firestore().collection("category");
    this.unsubscribe = null;
    this.state = {
      name: "",
      description: "",
      price: "",
      category: "Fashion",
      categorySelection: ""
    };
  }

  // query Catagory to show in Selection tab
  categoryQuery = async querySnapshot => {
    console.log(querySnapshot);
    const category = [];
    querySnapshot.forEach(doc => {
      const { name } = doc.data();
      category.push({
        key: doc.id,
        doc, // DocumentSnapshot
        name
      });
    });
    this.setState({
      categorySelection: category
    });
    await console.log(this.state);
  };

  componentDidMount() {
    this.unsubscribe = this.refCategory.onSnapshot(this.categoryQuery);
  }

  // set state follow data inputed
  onChange = e => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    this.setState(state);
    console.log(this.state);
  };

  // click add button event
  onSubmit = e => {
    e.preventDefault();
    const { name, description, price, category } = this.state;
    if (name != "" && description != "" && price != "" && category != "") {
      this.ref
        .add({
          name,
          description,
          price,
          category
        })
        .then(docRef => {
          this.setState({
            name: "",
            description: "",
            price: "",
            category: ""
          });
          this.props.history.push("/");
        })
        .catch(error => {
          console.error("เกิดข้อผิดพลาดจากการเพิ่มข้อมูล: ", error);
        });
    } else {
      window.alert("กรุณาใส่ข้อมูลให้ครบครับ");
    }
  };

  render() {
    const { name, description, price, category } = this.state;
    return (
      <div className="container mt-5">
        <div className="d-flex justify-content-start">
          <a className="btn btn-light">
            <Link to="/">กลับ</Link>
          </a>
        </div>
        <div className="panel panel-default text-center">
          <div className="panel-heading">
            <h3 className="panel-title">เพิ่มสินค้าใหม่</h3>
          </div>
          <br />
          <div className="panel-body">
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="name">ชื่อสินค้า:</label>
                <input
                  type="text"
                  className="form-control"
                  name="name"
                  value={name}
                  onChange={this.onChange}
                  placeholder="ชื่อสินค้า"
                />
              </div>
              <div className="form-group">
                <label htmlFor="description">รายละเอียดสินค้า</label>
                <textarea
                  className="form-control"
                  name="description"
                  onChange={this.onChange}
                  placeholder="รายละเอียดสินค้า"
                  cols="80"
                  rows="3"
                  defaultValue={description}
                />
              </div>
              <div className="form-group">
                <label htmlFor="price">ราคา:</label>
                <input
                  type="text"
                  className="form-control"
                  name="price"
                  value={price}
                  onChange={this.onChange}
                  placeholder="ราคาสินค้า"
                />
              </div>
              <div className="form-group">
                <label htmlFor="category">ประเภทสินค้า:</label>
                <select
                  className="form-control"
                  name="category"
                  onChange={this.onChange}
                >
                  {this.state.categorySelection != "" &&
                    this.state.categorySelection.map(cate => (
                      <option
                        key={cate.key}
                        value={cate.name}
                        selected={cate.key === 1 && "selected"}
                      >
                        {cate.name}
                      </option>
                    ))}
                </select>
              </div>
              <button type="submit" className="btn btn-success">
                เพิ่มสินค้า
              </button>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default Create;
