import React from 'react'
import './Item.css';

import Grid from '@mui/material/Grid2';
import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import LunchDiningIcon from '@mui/icons-material/LunchDining';

import ProductCard from '../../components/product-card/ProductCard';

import Chip from '@mui/material/Chip';
import OrderCard from '../../components/order-card/OrderCard';
import PaymentCard from '../../components/payment-card/PaymentCard';


function Item() {
  return (
    <div className={'item-main-outer'}>
        <Grid className={"main-grid"} container spacing={2} >
            <Grid size={8} paddingLeft={8} paddingTop={10}>
              <Grid size={12} container spacing={2}>
                <Grid size={12} className={"menu-item-head"}>
                  <span>Menu Item <span>(51)</span></span>
                  <div className="menu-option">
                    <Chip label={<SearchOutlinedIcon className='search-icon'/>} variant="outlined"clickable/>
                    <Chip label={<FilterAltIcon className='filter-icon'/>} variant="outlined"clickable/>
                  </div>
                 
                </Grid>
                <Grid size={12} className={"menu-item-categories"}>
                  <Chip icon={<LunchDiningIcon className='lunchDining-icon'/>} label={"All Item"} variant="outlined"clickable/>
                  <Chip icon={<LunchDiningIcon className='lunchDining-icon'/>} label={"Meals"} variant="outlined"clickable/>
                  <Chip icon={<LunchDiningIcon className='lunchDining-icon'/>} label={"Soups"} variant="outlined"clickable/>
                  <Chip icon={<LunchDiningIcon className='lunchDining-icon'/>} label={"Side Dish"} variant="outlined"clickable/>
                  <Chip icon={<LunchDiningIcon className='lunchDining-icon'/>} label={"Baverages"} variant="outlined"clickable/>
                </Grid>

                <Grid size={12} container spacing={2} className="item-content">
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  <Grid size={3}>
                    <ProductCard/>
                  </Grid>
                  
                  
                </Grid>

              </Grid>
              
              
            </Grid>
            <Grid size={4} paddingLeft={4} paddingRight={8} paddingTop={5}>
              <Grid size={12}  className={"checkout-outer"} paddingTop={5} paddingLeft={3} paddingRight={3} borderRadius={5} paddingBottom={5} >
                  <Grid size={12} className="order-summery-head">
                    <span>Order's summery</span>
                    <p>#219021</p>
                    <hr className='hr'/>
                    <span className='heading-total'>Total items <span>(2)</span></span>
                  </Grid>

                  <Grid size={12} className="order-summery-list" gap={2}>
                    <Grid size={12} container spacing={1} className="order-card-list-outer">
                      <OrderCard/>
                      <OrderCard/>
                      <OrderCard/>
              
                    </Grid>
                
                  </Grid>
                  <Grid size={12} className="order-summery-payment">
                    <PaymentCard/>
                  </Grid>
                  <Grid size={12} className="proceed-btn-outer">
                        <span className='place-order-btn'>Place Order</span>
                  </Grid>
              </Grid>

            </Grid>
        </Grid>
    </div>
  )
}

export default Item