import React, { useContext, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import './NavBar.css';
import { UserContext } from '../../hooks/UserContext';
import Cookies from 'js-cookie';
import OnlineStatus from '../../utils/OnlineStatus';

function NavBar() {
  const { user, setUser } = useContext(UserContext); // Assuming setUser is available in UserContext
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const navigate = useNavigate();

  // Toggle dropdown menu visibility
  const toggleDropdown = () => {
    setDropdownOpen(!dropdownOpen);
  };

  const {logout}  = useContext(UserContext);
  // Handle logout logic
  const handleLogout = () => {
    logout();
    navigate('/login');
    window.location.reload();
  };

  return (
    <div className={'nav-bar-outer'}>
      <nav className={'nav-bar'}>
        <div className="left-outer">
          <div className={'logo-outer'}>
            <span>Logo</span>
          </div>
        </div>

        <div className="middle-outer">
          <ul>
            <li>
              <Link to={'/dashboard'}>Dashboard</Link>
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
            {user && user.role.name === 'Admin' && (
              <li>
                <Link to={'/register'}>Registration</Link>
              </li>
            )}
          </ul>
        </div>

        <div className="right-outer">
          <div className="status-outer">
            <OnlineStatus />
          </div>
          <div className={'avatar-outer'}>
            {/* Toggle dropdown on avatar click */}
            <img
              className="avatar"
              src="assests/images/DefaultAvatar.png"
              alt="Avatar"
              onClick={toggleDropdown}
              style={{ cursor: 'pointer' }} // Add pointer cursor
            />
            {/* Dropdown menu */}
            {dropdownOpen && (
              <div className="dropdown-menu">
                <ul>
                  <li onClick={handleLogout}>Logout</li>
                </ul>
              </div>
            )}
          </div>
          <div className={'user-outer'}>
            <span>{user?user.username:"Guest User"}</span>
            <p>{user?user.role.name:''}</p>
          </div>
        </div>
      </nav>
    </div>
  );
}

export default NavBar;
