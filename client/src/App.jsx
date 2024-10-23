import { BrowserRouter as Router, Routes, Route, Link, useNavigate } from 'react-router-dom';
import './App.css';

import Dashboard from './screens/dashboard/Dashboard';
import Item from './screens/item/Item';
import Stock from './screens/stock/Stock';
import Category from './screens/category/Category';
import Checkout from './screens/checkout/Checkout';
import NavBar from './components/navbar/NavBar';
import Login from './screens/login/LogIn';
import { useEffect, useState } from 'react';
import Cookies from 'js-cookie';
import { UserProvider } from './hooks/UserContext';

function MainApp() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    // Get the accessToken from the cookies
    const accessToken = Cookies.get('accessToken');
    
    if (accessToken) {
      // If token exists, set the user as authenticated
      setIsAuthenticated(true);
    } else {
      // If token doesn't exist, redirect to login
      setIsAuthenticated(false);
      navigate('/login');
    }
  }, [navigate]);

  return (
    <div className={'main-outer'}>
      {isAuthenticated && ( // Conditionally render NavBar when authenticated
        <div className={'nav-bar-main-outer'}>
          <NavBar />
        </div>
      )}

      <div className={'routes-outer'}>
        <Routes>
          <Route path='/login' element={<Login />} />
          <Route path='/dashboard' element={<Dashboard />} />
          <Route path='/items' element={<Item />} />
          <Route path='/category' element={<Category />} />
          <Route path='/stock' element={<Stock />} />
          <Route path='/checkout' element={<Checkout />} />
        </Routes>
      </div>
    </div>
  );
}

function App() {
  return (
    <UserProvider>
      <Router>
        <MainApp />
      </Router>
    </UserProvider>
   
  );
}

export default App;
