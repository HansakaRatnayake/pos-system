import React from 'react'
import { Link } from 'react-router-dom';
import './NavBar.css';


function NavBar() {
  return (
    <div className={'nav-bar-outer'}>
        <nav className={'nav-bar'}>

            <div className="left-outer">
                <div className={'logo-outer'}>
                    <span><span>Logo</span></span>
                    
                </div>
            </div>

            <div className="middle-outer">
                <ul>
                    <li>
                        <Link to={'/'}>Dashboard</Link>
                    </li>
                    <li>
                        <Link to={'/items'}>Items</Link>
                    </li>
                    <li>
                        <Link to={'/category'}>Category</Link>
                    </li>
                    <li>
                        <Link to={'/stock'}>Stock</Link>
                    </li>
                    <li>
                        <Link to={'/checkout'}>Checkout</Link>
                    </li>
                </ul>

            </div>
            
            
            <div className="right-outer">
                <div className="status-outer">Online</div>
                <div className={'avatar-outer'}></div>
                <div className={'user-outer'}>
                    <span>Ranil Wikramasingha</span>
                    <p>Cashier</p>
                </div>


            </div>
            
        </nav>
    </div>
  )
}

export default NavBar