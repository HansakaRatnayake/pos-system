import axios from 'axios';
import React, { useEffect, useState } from 'react'

const baseURL = process.env.REACT_APP_API_URL;

function Dashboard() {

  const [displayUserCount, setDisplayUserCount] = useState(0);
  const [displayItemsCount, setDisplayItemsCount] = useState(0);
  const [displayCategoryCount, setDisplayCategoryCount] = useState(0);

  const countUp = (start, target, setDisplayCount) => {
    const duration = 500;
    const incrementTime = Math.floor(duration / target);
    let currentCount = start;

    const counter = setInterval(() => {
      currentCount += 1;
      setDisplayCount(currentCount);

      if (currentCount >= target) {
        clearInterval(counter);
      }
    }, incrementTime);
  };

  useEffect(() => {
    axios.get(`${baseURL}/users`, { withCredentials: true })
      .then(res => {
        const totalUsers = res.data.length;
        setDisplayUserCount(totalUsers);
        
      })
      .catch(err => console.log(err));

    axios.get(`${baseURL}/categories`, { withCredentials: true })
      .then(res => {
        const totalcategories = res.data.length;
                
        setDisplayCategoryCount(totalcategories);
        countUp(-1, totalcategories, setDisplayCategoryCount);
      })
      .catch(err => console.log(err));

    axios.get(`${baseURL}/items`, { withCredentials: true })
      .then(res => {
        const totalItems = res.data.length;
        setDisplayItemsCount(totalItems);
        countUp(-1, totalItems, setDisplayItemsCount);
      })
      .catch(err => console.log(err));
  }, []);

  return (
    <div style={{ padding: '1.5rem',display:'flex',flexDirection:'column',justifyItems:'center',alignItems:'center' }}>
      {/* Welcome Banner */}
      <div style={{width: '100%', background: 'linear-gradient(to right, #3B82F6, #A855F7, #EC4899)', borderRadius: '0.5rem', boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)', marginBottom: '2rem', padding: '1.5rem', color: 'white', textAlign: 'center' }}>
        <h1 style={{ fontSize: '2.25rem', fontWeight: 'bold', marginBottom: '0.5rem' }}>Welcome to Your Dashboard!</h1>
        <p style={{ fontSize: '1.125rem' }}>Stay on top of your data and manage everything with ease</p>
      </div>

      <div style={{borderRadius: '0.5rem', width: '100%', height: '15rem', backgroundColor: 'white', boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)', padding: '1rem' }}>
        <span style={{ fontSize: '1.5rem', fontWeight: 'bold' }}>Dashboard</span>
        <div style={{ display: 'flex', marginBottom: '2rem' }}>
          <div style={{ width: '30%', margin: '1rem', backgroundColor: '#1E4263', boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)', display: 'flex', justifyContent: 'center', alignItems: 'center', padding: '1rem',borderRadius: '1rem' }}>
            <div>
              <div style={{ color: '#F3F4F6' }}>Total Users</div>
              <div style={{ color: '#F3F4F6', textAlign: 'center', fontSize: '2rem' }}>{displayUserCount}</div>
            </div>
          </div>

          <div style={{ width: '30%', margin: '1rem', backgroundColor: '#1E4263', boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)', display: 'flex', justifyContent: 'center', alignItems: 'center', padding: '1rem',borderRadius: '1rem' }}>
            <div>
              <div style={{ color: '#F3F4F6' }}>Total Items</div>
              <div style={{ color: '#F3F4F6', textAlign: 'center', fontSize: '2rem' }}>{displayItemsCount}</div>
            </div>
          </div>
          <div style={{ width: '30%', margin: '1rem', backgroundColor: '#1E4263', boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)', display: 'flex', justifyContent: 'center', alignItems: 'center', padding: '1rem',borderRadius: '1rem' }}>
            <div>
              <div style={{ color: '#F3F4F6' }}>Total Categories</div>
              <div style={{ color: '#F3F4F6', textAlign: 'center', fontSize: '2rem' }}>{displayCategoryCount}</div>
            </div>
          </div>
        </div>
      </div>


    </div>
  )
}

export default Dashboard