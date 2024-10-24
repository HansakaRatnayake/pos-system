import { createContext, useState } from "react";
import { useNavigate } from "react-router-dom";

// Create the UserContext
export const UserContext = createContext(null);

// Create the provider
export const UserProvider = ({children}) => {
    const [user, setUser] = useState(() => {
        const storedUser = localStorage.getItem('user');
        return storedUser ? JSON.parse(storedUser) : null;
    });

  

    const login = (userData) => {
        setUser(userData);
        localStorage.setItem('user', JSON.stringify(userData));
    };

    const logout = () => {
        setUser(null);
        localStorage.removeItem('user');
        document.cookie = 'accessToken=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
       
    };

    return (
        <UserContext.Provider value={{ user, login, logout }}>
          {children}
        </UserContext.Provider>
    );
};
