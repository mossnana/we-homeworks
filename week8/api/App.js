import React, {Component} from 'react'
import App2 from './App2'

class App extends Component {

  state = {
    code: '',
    name: '',
    categories: '',
    status: true
  }

  render() {
    let table = <div>Loading ... </div>
    return (
      <div className="App">
        <h1>Sample Form</h1>
        <form onSubmit={this.handleSubmit}>
            <div>รหัส :
                <input type="text" value={this.state.value} onChange={this.handleChange} name="code" placeholder="กรอกข้อมูล" />

            </div>
            <div>ชื่อสินค้า :
                <input type="text" value={this.state.value} onChange={this.handleChange} name="name" placeholder="กรอกข้อมูล" />
            </div>
            <div>หมวดสินค้า :
              <select name="categories" onChange={this.handleChange} value={this.state.categories}>
                  <option value=''> เลือกหมวดสินค้า</option>
                  <option value='1'> Computer</option>
                  <option value='2'> Book</option>
                  <option value='3'> Electronic</option>
              </select>
            </div>
            <div>
              ปกติ:
              <input type="checkbox" checked={this.state.status} onChange={this.handleChange} name="status" />
            </div>
          <button type="submit">Submit</button>
        </form>

        <div>
          <table>
            <thead>
              <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Categories</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Code</td>
                <td>Name</td>
                <td>Categories</td>
              </tr>
            </tbody>
          </table>
        </div>
        <App2 />
      </div>
    );
  }
  handleChange = (e) => {
    const value = e.target.type === 'checkbox' ? e.target.checked : e.target.value
    const name = e.target.names
    this.setState({
      name: value
    })
  }
  handleSubmit = (e) => {
    e.preventDefault() // ป้องกันการ Submit
    console.log(this.state)
  }
}
export default App;
