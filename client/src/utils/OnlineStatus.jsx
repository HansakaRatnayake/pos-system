import React, { useState, useEffect } from 'react';

const OnlineStatus = () => {
  // Track the online status using state
  const [isOnline, setIsOnline] = useState(navigator.onLine);

  // Use useEffect to add event listeners for online/offline events
  useEffect(() => {
    const handleOnline = () => {
      setIsOnline(true);
    };

    const handleOffline = () => {
      setIsOnline(false);
    };

    // Add event listeners
    window.addEventListener('online', handleOnline);
    window.addEventListener('offline', handleOffline);

    // Clean up event listeners on component unmount
    return () => {
      window.removeEventListener('online', handleOnline);
      window.removeEventListener('offline', handleOffline);
    };
  }, []);

  return (
    <div>
      {isOnline ? (
        <p className='online'>Online</p>
      ) : (
        <p className='offline'>Offline</p>
      )}
    </div>
  );
};

export default OnlineStatus;
