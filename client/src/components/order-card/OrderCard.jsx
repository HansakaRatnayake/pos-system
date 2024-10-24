import React from 'react'
import "./OrderCard.css";

import Grid from '@mui/material/Grid2';

import DeleteOutlinedIcon from '@mui/icons-material/DeleteOutlined';


function OrderCard({cartItem, onOrderRemove}) {

   
    const handleRemoveFromCart = () => {
        onOrderRemove(cartItem);
    }
    
  return (
    <div className='order-card-main-outer'>
        <Grid size={12} className="order-main-grid" gap={2}>
            <Grid size={3} className="order-image-outer">
                <img src={`data:image/png;base64,${cartItem.photo}`} alt="product-name" />
            </Grid>
            <Grid size={6} className="detail-outer">
                <span>{cartItem.name}</span>
                <p>(${cartItem.price}) * {cartItem.qty}</p>  
            </Grid>
            <Grid size={3} className="option-outer">
                <div className='delete-icon-outer' onClick={handleRemoveFromCart}><DeleteOutlinedIcon className='delete-icon'/></div>
            </Grid>
        </Grid>
    </div>
  )
}

export default OrderCard