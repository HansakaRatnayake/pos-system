import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import './App.css';

import Dashboard from './screens/dashboard/Dashboard';
import Item from './screens/item/Item';
import Stock from './screens/stock/Stock';
import Category from './screens/category/Category';
import Checkout from './screens/checkout/Checkout';
import NavBar from './components/navbar/NavBar';
import Login from './screens/login/Login';



function App() {
  return (
      <Router>
        <div className={'main-outer'}>
          
          <div className={'nav-bar-main-outer'}>
            <NavBar/>
          </div>
        
          <div className={'routes-outer'}>
            <Routes>
                <Route path='/login' element={<Login/>} />
                <Route path='/' element={<Dashboard/>} />
                <Route path='/items' element={<Item/>} />
                <Route path='/category' element={<Category/>} />
                <Route path='/stock' element={<Stock/>} />
                <Route path='/checkout' element={<Checkout/>} />

            </Routes>
          </div>         
        </div>
      </Router>
 
  );
}

export default App;
