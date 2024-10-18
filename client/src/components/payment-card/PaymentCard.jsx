import React from 'react';
import "./PaymentCard.css";

import Grid from '@mui/material/Grid2';
import Chip from '@mui/material/Chip';



function PaymentCard() {
  return (
    <div className='payment-main-outer'>
        <Grid container spacing={1}>
            <Grid size={12} className="payment-summery-head">
                <span>Payment Summery</span>
            </Grid>
            <Grid size={12} className="price-outer">
                <span>Price</span>
                <span>$123,0</span>
            </Grid>
            <Grid size={12} className="discount-outer">
                <span>Discount</span>
                <span>$13,0</span>
                
            </Grid>
            <Grid size={12}>
            <hr className='hr'/>
            </Grid>
           
            <Grid size={12} className="total-outer">
                <span>Total</span>
                <span>$110,0</span>
            </Grid>
        </Grid>
    </div>
  )
}

export default PaymentCard