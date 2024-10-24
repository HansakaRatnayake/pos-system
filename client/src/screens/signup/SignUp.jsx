import React, { useContext, useEffect, useState } from 'react';
import './SignUp.css';

import Axios from 'axios';
import Cookies from 'js-cookie';
import {Button, TextField, Typography, Box, Divider } from "@mui/material";
import GoogleIcon from '@mui/icons-material/Google'; // Google Icon
import AppleIcon from '@mui/icons-material/Apple'; // Apple Icon
import Grid from '@mui/material/Grid2';
import { Link, useNavigate } from 'react-router-dom';
import { UserContext } from '../../hooks/UserContext';


const  SignUp = () => {
  
  const url = process.env.REACT_APP_API_URL;

  const accessToken = Cookies.get('accessToken');

  const [loginCredentials, setLoginCredentials] = useState({
    username:'',
    password:'',
    email:'',
    mobile:'',
    role:{
      id:1
    }
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

  

  const handleLoginAction = (e) => {
    e.preventDefault();    
    
    Axios.post(`${url}/auth/register`, loginCredentials,{withCredentials: true})
    .then((res)=>{
      const {id, username, mobile, email, userstatus, role} = res.data;
      setAuthUser({...authUser, id, username, mobile, email, userstatus, role});
    //   login(res.data);
      navigate('/dashboard');
      
    })
    .catch((err)=>{
      console.log(err);
      
    })

  }

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
                          SignUp
                        </Typography>
                        <Typography variant="body2" color="textSecondary">
                          Already have an account? <Link to="/login">LogIn</Link>
                        </Typography>

                        <Divider style={{ margin: "20px 0" }} />

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

                            <TextField
                              required
                              label="mobile"
                              variant="outlined"
                              type="number"
                              fullWidth
                              margin="normal"
                              name='mobile'
                              onChange={handleTextFieldChange}
                            />

                            {/* <TextField
                              required
                              select
                              label="select role"
                              variant="outlined"
                              fullWidth
                              margin="normal"
                              name='role'
                              onChange={handleTextFieldChange}
                            />  */}

                           
                            

                            {/* Sign-in button */}
                            <Button
                              variant="contained"
                              fullWidth
                              color="primary"
                              style={{ marginTop: "20px" }}
                              type='submit'
                            >
                              SignUp 
                            </Button>
                        </form>
                      </Box>
                    </Grid>
                        
                   </Grid>
                   

        </div>
        
    </div>
  )
}



export default SignUp;