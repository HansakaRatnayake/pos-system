import { BrowserRouter as Router, Routes, Route, useNavigate, useLocation } from 'react-router-dom';
import './App.css';

import Dashboard from './screens/dashboard/Dashboard';
import Item from './screens/item/Item';
import Stock from './screens/stock/Stock';
import Register from './screens/register/register';
import Category from './screens/category/Category';
import Checkout from './screens/checkout/Checkout';
import NavBar from './components/navbar/NavBar';
import Login from './screens/login/LogIn';
import SignUp from './screens/signup/SignUp';
import { useEffect, useState } from 'react';
import Cookies from 'js-cookie';
import { UserProvider } from './hooks/UserContext';
import { Toaster } from "react-hot-toast";

function MainApp() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const navigate = useNavigate();
  const location = useLocation(); // Get the current path

  useEffect(() => {
    // Get the accessToken from the cookies
    const accessToken = Cookies.get('accessToken');
    
    if (accessToken) {
      // If token exists, set the user as authenticated
      setIsAuthenticated(true);
    } else {
      // If no token and user is not on login or signup page, redirect to login
      if (location.pathname !== '/login' && location.pathname !== '/signup') {
        navigate('/login');
      }
    }
  }, [navigate, location]);

  return (
    <div className={'main-outer'}>
      {/* Only show NavBar if the user is authenticated */}
      {isAuthenticated && (
        <div className={'nav-bar-main-outer'}>
          <NavBar />
        </div>
      )}
      
      <div className={'routes-outer'}>
        <Routes>
          {!isAuthenticated ? (
            <>
              {/* If not authenticated, allow navigation between login and signup */}
              <Route path='/login' element={<Login />} />
              <Route path='/signup' element={<SignUp />} />
            </>
          ) : (
            <>
              {/* Main application routes, accessible only if authenticated */}
              <Route path='/dashboard' element={<Dashboard />} />
              <Route path='/items' element={<Item />} />
              <Route path='/category' element={<Category />} />
              <Route path='/stock' element={<Stock />} />
              <Route path='/checkout' element={<Checkout />} />
              <Route path='/register' element={<Register />} />
            </>
          )}
        </Routes>
      </div>
    </div>
  );
}

function App() {
  return (
    <UserProvider>
      <Toaster position="top-right" />
      <Router>
        <MainApp />
      </Router>
    </UserProvider>
  );
}

export default App;
