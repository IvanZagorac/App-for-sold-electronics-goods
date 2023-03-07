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
import { Routes, Route, BrowserRouter} from "react-router-dom";
import ContactPage from "./components/ContactPage/ContactPage";
import UserLoginPage from "./components/UserLoginPage/UserLoginPage";
import CategoryPage from "./components/CategoryPage/CategoryPage";
import UserRegistrationPage from "./components/UserRegistrationPage/UserRegistrationPage";
import OrdersPage from "./components/OrdersPage/OrderPage";
import AdministratorLoginPage from "./components/AdministratorLoginPage/AdministratorLoginPage";
import AdministratorDashboard from "./components/AdministratorDashboard/AdministratorDashboard";
import AdministratorDashboardCategory from "./components/AdministratorDashboardCategory/AdministratorDashboardCategory";
import AdministratorDashboardFeature from "./components/AdministratorDashboardFeature/AdministratorDashboardFeature";
import AdministratorDashboardArticle from "./components/AdministratorDashboardArticle/AdministratorDashboardArticle";
import AdministratorDashboardPhoto from "./components/AdministratorDashboardPhoto/AdministratorDashboardPhoto";
import ArticlePage from "./components/Article/ArticlePage";




const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
      <BrowserRouter>
          <Routes>
              <Route path="/" element={<HomePage/>}/>
              <Route path="/contact/" element={<ContactPage/>}/>
              <Route path="/auth/user/register" element={<UserRegistrationPage/>}/>
              <Route path="/auth/user/login/" element={<UserLoginPage/>}/>
              <Route path="/article/:aId" element={<ArticlePage/>}/>
              <Route path="/category/:cId/" element={<CategoryPage/>}/>
              <Route path="/user/order" element={<OrdersPage/>}/>
              <Route path="/administrator/login" element={<AdministratorLoginPage/>}/>
              <Route path="/administrator/dashboard" element={<AdministratorDashboard/>}/>
              <Route path="/administrator/dashboard/category" element={<AdministratorDashboardCategory/>}/>
              <Route path="/administrator/dashboard/feature/:cId" element={<AdministratorDashboardFeature/>}/>
              <Route path="/administrator/dashboard/article" element={<AdministratorDashboardArticle/>}/>
              <Route path="/administrator/dashboard/photo/:aId" element={<AdministratorDashboardPhoto/>}/>
          </Routes>
      </BrowserRouter>
  </React.StrictMode>
);
//
// If you want to start measuring performance in your HomePage, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
