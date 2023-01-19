import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import HomePage from './components/HomePage/HomePage';
import reportWebVitals from './reportWebVitals';
import 'bootstrap/dist/css/bootstrap.min.css'
import 'jquery/dist/jquery.js';
import 'popper.js/dist/popper.js'
import 'bootstrap/dist/js/bootstrap.min.js';
import '@fortawesome/fontawesome-free/css/fontawesome.min.css'
//import {MainMenu, MainMenuItem} from "./components/MainMenu/MainMenu";
import {HashRouter, Routes, Route, Link, BrowserRouter} from "react-router-dom";
import ContactPage from "./components/ContactPage/ContactPage";
import UserLoginPage from "./components/UserLoginPage/UserLoginPage";
import CategoryPage from "./components/CategoryPage/CategoryPage";
import UserRegistrationPage from "./components/UserRegistrationPage/UserRegistrationPage";
import Cart from "./components/Cart/Cart";
import {Col, Row} from "react-bootstrap";
import OrdersPage from "./components/OrdersPage/OrderPage";


/*const menuItems=[
    new MainMenuItem("Home","/"),
    new MainMenuItem("Contact","/contact/"),
    new MainMenuItem("Log In","/user/login/"),
    new MainMenuItem("Cat","/category/1/"),
]*/

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
      <BrowserRouter>
          <Row>
              <Col xs="9" sm="9" md="9" lg="9">
                  <nav className="navigacija">
                      <Link className="linkovi" to="/">Home</Link>
                      <Link className="linkovi" to="/contact/">Contact</Link>
                      <Link className="linkovi" to="/auth/user/login/">Log In</Link>
                      <Link className="linkovi" to="/auth/user/register/">Register</Link>
                      <Link className="linkovi" to="/user/order">Orders</Link>

                  </nav>
              </Col>
              <Col xs="3" sm="3" md="3" lg="3">
                  <Cart></Cart>
              </Col>
          </Row>

          <Routes>
              <Route path="/" element={<HomePage/>}/>
              <Route path="/contact/" element={<ContactPage/>}/>
              <Route path="/auth/user/register" element={<UserRegistrationPage/>}/>
              <Route path="/auth/user/login/" element={<UserLoginPage/>}/>
              <Route path="/category/:cId/" element={<CategoryPage/>}/>
              <Route path="/user/order" element={<OrdersPage/>}/>
          </Routes>
      </BrowserRouter>
  </React.StrictMode>
);
//
// If you want to start measuring performance in your HomePage, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
