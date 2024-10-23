import React, { useContext } from 'react'
import { Link } from 'react-router-dom';
import './NavBar.css';
import { UserContext } from '../../hooks/UserContext';
import OnlineStatus from '../../utils/OnlineStatus';


function NavBar() {

    const {user} = useContext(UserContext);

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
                    <div className="status-outer"><OnlineStatus/></div>
                    <div className={'avatar-outer'}>
                        <img className='avatar' src="assests/images/DefaultAvatar.png" alt="Avatar" />
                    </div>
                    <div className={'user-outer'}>
                        <span>{user.username}</span>
                        <p>{user.role.name}</p>
                    </div>


                </div>
                
            </nav>
        </div>
    )
}

export default NavBar