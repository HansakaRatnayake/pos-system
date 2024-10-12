import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

import Dashboard from './view/Dashboard';
import Item from './view/Item';
import Stock from './view/Stock';
import Category from './view/Category';
import Checkout from './view/Checkout';





function App() {
  return (
  
      <Router>
        <div>
          <nav>
            <ul>
              <li><Link to={'/dashboard'}>Dashboard</Link></li>
              <li><Link to={'/items'}>Items</Link></li>
              <li><Link to={'/category'}>Category</Link></li>
              <li><Link to={'/stock'}>Stock</Link></li>
              <li><Link to={'/checkout'}>Checkout</Link></li>
            </ul>
          </nav>

          <Routes>
            <Route path='/' element={<Dashboard/>} />
            <Route path='/items' element={<Item/>} />
            <Route path='/category' element={<Category/>} />
            <Route path='/stock' element={<Stock/>} />
            <Route path='/checkout' element={<Checkout/>} />


          </Routes>
        </div>
      </Router>
 
  );
}

export default App;
