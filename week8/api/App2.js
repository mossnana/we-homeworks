import React, {Component} from 'react'

class App2 extends Component {
  state = {
    data: null,
    err: null,
    code: "",
    name: "",
    categories: ""
  }

  componentDidMount(){
    fetch('https://jsonplaceholder.typicode.com/posts')
    .then(response => response.json())
    .then(json => {
      this.setState({
        data: json
      })})
      .catch(e=>this.setState({err: e.message}))
    }

    handleChange = (e) => {
      const value = e.target.type === 'checkbox' ? e.target.checked : e.target.value
      const name = e.target.names
      const codevalue = parseInt(this.state.data.id) + 1
      this.setState({
        name: value,
        code: codevalue
      })
    }

    handleSubmit = (e) => {
      e.preventDefault() // ป้องกันการ Submit
      console.log(this.state)
      this.state.data.push({
        id: this.state.code,
        title: this.state.name,
      })
      this.setState({
        data: this.state.data
      })
    }

  render() {
    console.log("Hello")
    const {data, err} = this.state
    let list = <div>Loading ... </div>

    if(data){
      if(data.length > 0){
        console.log(data.length)
        list = data.map(r => {
          return(
            <div key={r.id}>
              <h3>{r.id} {r.title}</h3>
              {r.body}
            </div>
          )
        })
      }
      else{
        list = <div>No Data</div>
      }
    }

    if(err){
      list = <div>Error: {err}</div>
    }
    return (
      <div className="App">
        <h1>Load Data From JSON</h1>
        <div>
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
        </div>
        {list}
      </div>
    )
  }
}

export default App2
