import React, { useState  ,useEffect, useContext} from 'react';
import "./PaymentCard.css";

import Grid from '@mui/material/Grid2';
import Chip from '@mui/material/Chip';

function PaymentCard({item}) {

  const [discount, setDiscount] = useState(0);
  const [price, setPrice] = useState(0);
  const [orderItem, setOrderItem] = useState([]);

  console.log(item);
  

  
    useEffect(() => {
      setOrderItem(item || []);  
    }, [item]);
  
    useEffect(() => {
      let totalDiscount = 0;
      let totalPrice = 0;
  
      orderItem.forEach((itm) => {
        totalDiscount += itm.discount;
        totalPrice += itm.price * itm.qty;
      });
  
      setDiscount(totalDiscount);
      setPrice(totalPrice);
    }, [orderItem]);


  return (
    <div className='payment-main-outer'>
        <Grid container spacing={1}>
            <Grid size={12} className="payment-summery-head">
                <span>Payment Summery</span>
            </Grid>
            <Grid size={12} className="price-outer">
                <span>Price</span>
                <span>${price.toFixed(2)}</span>
            </Grid>
            <Grid size={12} className="discount-outer">
                <span>Discount</span>
                <span>${discount?discount.toFixed(2):0}</span>
                
            </Grid>
            <Grid size={12}>
            <hr className='hr'/>
            </Grid>
           
            <Grid size={12} className="total-outer">
                <span>Total</span>
                <span>${discount?(price-discount).toFixed(2):price.toFixed(2)}</span>
            </Grid>
        </Grid>



        
    </div>
  )
}

export default PaymentCard