import React, { useContext, useEffect, useState } from 'react';
import './LogIn.css';

import Axios from 'axios';
import Cookies from 'js-cookie';
import {Button, TextField, Typography, Box, Divider } from "@mui/material";
import GoogleIcon from '@mui/icons-material/Google'; // Google Icon
import AppleIcon from '@mui/icons-material/Apple'; // Apple Icon
import Grid from '@mui/material/Grid2';
import { useNavigate } from 'react-router-dom';
import { UserContext } from '../../hooks/UserContext';


const  LogIn = () => {
  
  const url = process.env.REACT_APP_API_URL;

  const accessToken = Cookies.get('accessToken');

  const [loginCredentials, setLoginCredentials] = useState({
    username:'',
    password:''
  });
  const navigate = useNavigate();
  const [authUser, setAuthUser] = useState({
    id: '',
    username: '',
    mobile: '',
    email: '',
    userstatus: '',
    role: ''
  });

  const {login} = useContext(UserContext);


  const handleLoginAction = (e) => {
    e.preventDefault();    
    
    Axios.post(`${url}/auth/authenticate`, loginCredentials,{withCredentials: true})
    .then((res)=>{
      const {id, username, mobile, email, userstatus, role} = res.data;
      setAuthUser({...authUser, id, username, mobile, email, userstatus, role});
      login(res.data);
      navigate('/dashboard');
      
    })
    .catch((err)=>{
      console.log(err);
      
    })

  }

  useEffect(()=>{})

  const handleTextFieldChange = (e) => {
    const {name, value} = e.target;
    setLoginCredentials({...loginCredentials,[name]:value});

  }

  return (
    <div className='login-main-outer'>
        <div className="login-card">

            <Grid className="login-card-grid" container spacing={0}>
                <Grid className="login-image-outer" size={{ md:6, xs:12}}>
                    <img className='login-image' src="assests/images/loginimg.png" alt="login-page-image" />
                </Grid>

                
                    <Grid
                      item
                      size={{ md:6, xs:12}}
                      style={{
                        display: "flex",
                        justifyContent: "center",
                        alignItems: "center",
                      }}
                    >
                      <Box style={{ width: "80%", maxWidth: "400px"}}>
                        {/* Sign-in text */}
                        <Typography variant="h4" gutterBottom>
                          LogIn
                        </Typography>
                        <Typography variant="body2" color="textSecondary">
                          Don’t have an account? <a href="/signup">Sign up</a>
                        </Typography>

                        <Divider style={{ margin: "20px 0" }} />

                        {/* Third-party login buttons */}
                        {/* <Button
                          variant="outlined"
                          fullWidth
                          startIcon={<GoogleIcon />}
                          style={{ marginBottom: "10px" }}
                        >
                          Sign in with Google
                        </Button>
                        <Button
                          variant="outlined"
                          fullWidth
                          startIcon={<AppleIcon />}
                          style={{ marginBottom: "20px" }}
                        >
                          Sign in with Apple
                        </Button>

                        <Typography variant="body2" align="center">
                          Or continue with email
                        </Typography> */}

                        {/* Email and Password input */}
                        <form onSubmit={handleLoginAction}>
                            <TextField
                              required
                              label="Email Address"
                              variant="outlined"
                              fullWidth
                              margin="normal"
                              name='username'
                              onChange={handleTextFieldChange}
                              
                            />
                            <TextField
                              required
                              label="Password"
                              variant="outlined"
                              type="password"
                              fullWidth
                              margin="normal"
                              name='password'
                              onChange={handleTextFieldChange}
                            />

                            {/* Sign-in button */}
                            <Button
                              variant="contained"
                              fullWidth
                              color="primary"
                              style={{ marginTop: "20px" }}
                              type='submit'
                            >
                              Login 
                            </Button>
                        </form>
                      </Box>
                    </Grid>
                        
                   </Grid>
                   

        </div>
        
    </div>
  )
}



export default LogIn;