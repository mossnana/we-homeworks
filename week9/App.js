import React, { Component } from 'react';
// Image and Stylesheet
import logo from './logo.svg';
import 'bootstrap/dist/css/bootstrap.min.css'
// Import React Route and Link
import {Route, Link} from 'react-router-dom'
// Import Components
import Header from './Header'
import ThemedButton from './ThemedButton'
import Home from './pages/Home'
import User from './pages/User'

// React Context -> create global variable
export const BtnColorContext = React.createContext('btn btn-danger')

class App extends Component {
  render() {
    return(
    {/* <<global variable>>.Provider ใช้ครอบ component เพื่อให้ component ที่ถูกครอบสามารถใช้ตัวแปรได้ */}
      <BtnColorContext.Provider value="btn btn-danger">
        <Header>
          <li class="nav-item active">
            {/* <Link/> ใช้เหมือน <a/> ใน HTML เพื่อสร้าง Link ใน React Router */}
            <Link to='/' className="nav-link">หน้าหลัก</Link>
          </li>
          <li class="nav-item">
            <Link to='/user' className="nav-link">User</Link>
          </li>
        </Header>
        {/* ก้อน container ในส่วนด้านล่างนี้ใช้แสดง component นั้นๆ ตาม url */}
        <div className="container">
          <Route path="/" exact component={Home} />
          <Route path="/user" component={User} />
        </div>
      </BtnColorContext.Provider>
    );
  }
}

const Button = (props) => {
  return(
    <div className="container">
      <ThemedButton/>
    </div>
  )
}

export default App;
