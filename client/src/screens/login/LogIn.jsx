import React from 'react';
import './LogIn.css';


import {Button, TextField, Typography, Box, Divider } from "@mui/material";
import GoogleIcon from '@mui/icons-material/Google'; // Google Icon
import AppleIcon from '@mui/icons-material/Apple'; // Apple Icon

import Grid from '@mui/material/Grid2';

const  LogIn = () => {
  return (
    <div className='login-main-outer'>
        <div className="login-card">

            <Grid className="login-card-grid" container spacing={0}>
                <Grid className="image-outer" size={{ md:6, xs:12}}>
                    <img className='image' src="assests/images/loginimg.png" alt="login-page-image" />
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
                        <Button
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
                        </Typography>

                        {/* Email and Password input */}
                        <TextField
                          label="Email Address"
                          variant="outlined"
                          fullWidth
                          margin="normal"
                        />
                        <TextField
                          label="Password"
                          variant="outlined"
                          type="password"
                          fullWidth
                          margin="normal"
                        />

                        {/* Sign-in button */}
                        <Button
                          variant="contained"
                          fullWidth
                          color="primary"
                          style={{ marginTop: "20px" }}
                        >
                          Login 
                        </Button>
                      </Box>
                    </Grid>
                        
                   </Grid>
                   

        </div>
        
    </div>
  )
}



export default LogIn;