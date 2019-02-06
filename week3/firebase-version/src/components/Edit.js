import React, { Component } from "react";
import firebase from "../Firebase";
import { Link } from "react-router-dom";

class Edit extends Component {
  constructor(props) {
    super(props);
    this.refCategory = firebase.firestore().collection("category");
    this.unsubscribe = null;
    this.state = {
      key: "",
      name: "",
      description: "",
      price: "",
      category: "",
      categorySelection: ""
    };
    console.log(this.props.match.params.id);
  }

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
    const ref = firebase
      .firestore()
      .collection("myshop")
      .doc(this.props.match.params.id);
    ref.get().then(doc => {
      if (doc.exists) {
        const product = doc.data();
        this.setState({
          key: this.props.match.params.id,
          name: product.name,
          description: product.description,
          price: product.price,
          category: product.category
        });
      } else {
        this.props.history.push("/");
      }
    });
  }

  onChange = e => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    this.setState({ myshop: state });
    console.log(this.state);
  };

  onSubmit = e => {
    e.preventDefault();

    const { name, description, price, category } = this.state;

    const updateRef = firebase
      .firestore()
      .collection("myshop")
      .doc(this.state.key);
    updateRef
      .set({
        name,
        description,
        price,
        category
      })
      .then(docRef => {
        this.setState({
          key: "",
          name: "",
          description: "",
          price: "",
          category: ""
        });
        this.props.history.push("/show/" + this.props.match.params.id);
      })
      .catch(error => {
        console.error("Error adding document: ", error);
      });
  };

  render() {
    const { name, description, price, category } = this.state;
    return (
      <div className="container mt-5">
        <div className="d-flex justify-content-start">
          <a>
            <Link to={`/show/${this.state.key}`} className="btn btn-light">
              กลับ
            </Link>
          </a>
          <br />
          <br />
        </div>
        <div className="panel panel-default text-center">
          <div className="panel-heading">
            <h3 className="panel-title">
              แก้ไขสินค้าหมายเลขที่
              <span className="btn btn-light text-muted">{this.state.key}</span>
            </h3>
          </div>
          <div className="panel-body">
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="name">ชื่อสินค้า: </label>
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
                <label htmlFor="description">รายละเอียดสินค้า:</label>
                <textarea
                  className="form-control"
                  name="description"
                  onChange={this.onChange}
                  placeholder={description}
                  cols="80"
                  rows="3"
                  value={description}
                />
              </div>
              <div className="form-group">
                <label htmlFor="price">ราคาสินค้า:</label>
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
                <label htmlFor="category">กลุ่มสินค้า: </label>
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
                        selected={
                          this.state.category === cate.name && "selected"
                        }
                      >
                        {cate.name}
                      </option>
                    ))}
                </select>
              </div>
              <button type="submit" className="btn btn-success">
                แก้ไขข้อมูล
              </button>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default Edit;
