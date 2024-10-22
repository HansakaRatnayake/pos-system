import React from 'react';

import Grid from '@mui/material/Grid2';

export default function Login() {
  return (
    <div className='login-main-outer'>
        <Grid  container spacing={2}>
            <Grid size={6}>
                <div className="image-outer">
                    <img className='image' src="assests/images/loginimg.png" alt="login-page-image" />
                </div>
            </Grid>

             <Grid size={6}>
                <span>login creditials</span>
            </Grid>
        </Grid>
    </div>
  )
}
