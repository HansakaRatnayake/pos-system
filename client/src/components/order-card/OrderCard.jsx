import React from 'react'
import "./OrderCard.css";

import Grid from '@mui/material/Grid2';

import DeleteOutlinedIcon from '@mui/icons-material/DeleteOutlined';


function OrderCard() {
  return (
    <div className='order-card-main-outer'>
        <Grid size={12} className="order-main-grid" gap={2}>
            <Grid size={3} className="order-image-outer">
                <img src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/1/23/0/FN_healthy-fast-food-red-robin-avocado-cobb-salad_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1516723515457.jpeg" alt="product-name" />
            </Grid>
            <Grid size={6} className="detail-outer">
                <span>Deep Fried Wonton</span>
                <p>($15.0 ) * 2</p>
            </Grid>
            <Grid size={3} className="option-outer">
                <div className='delete-icon-outer'><DeleteOutlinedIcon className='delete-icon'/></div>
            </Grid>
        </Grid>
    </div>
  )
}

export default OrderCard