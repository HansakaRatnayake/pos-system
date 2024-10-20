import React, { useState } from 'react';
import './Item.css';

import Grid from '@mui/material/Grid2';
import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import TurnedInOutlinedIcon from '@mui/icons-material/TurnedInOutlined';

import ProductCard from '../../components/product-card/ProductCard';
import OrderCard from '../../components/order-card/OrderCard';
import PaymentCard from '../../components/payment-card/PaymentCard';

import Chip from '@mui/material/Chip';
import TextField from '@mui/material/TextField';

function Item() {

  const [isClickSearchBtn, setIsClickSearchBtn] = useState(true); 
  const [search, setSearch] = useState('');
  const [cartItem, setCartItem] = useState([]);

  // Function to toggle search bar visibility
  const handleSearchBtn = () => {
    setIsClickSearchBtn(!isClickSearchBtn);
  }

  // Update search state when input changes
  const handleSearch = (event) => {
    setSearch(event.target.value); // Update search state with input value
  }

  return (
    <div className={'item-main-outer'}>
      <Grid className={"main-grid"} container spacing={2} >
        <Grid size={8} paddingLeft={8} paddingTop={10}>
          <Grid size={12} container spacing={2}>
            <Grid size={12} className={"menu-item-head"}>
              <span>Menu Item <span>(51)</span></span>
              <div className="menu-option">
                {isClickSearchBtn ? 
                (
                  <TextField
                    label={<span><SearchOutlinedIcon className='search-icon' /> Search By Name</span>}
                    className='txtsearch'
                    value={search} 
                    onChange={handleSearch}
                    type="text"
                    size="small"
                  />
                ) 
                : 
                (
                  <></>
                )}
                {/* Ensure onClick works for the search button */}
                {/* <Chip 
                  label={<SearchOutlinedIcon className='search-icon' />} 
                  variant="outlined" 
                  clickable 
                  onClick={handleSearchBtn} // Correct function
                /> */}
                {/* <Chip label={<FilterAltIcon className='filter-icon' />} variant="outlined" clickable /> */}
              </div>
            </Grid>

            {/* Other sections of your UI */}
            <Grid size={12} className={"menu-item-categories"}>
              <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"All Item"} variant="outlined" clickable/>
              <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"Meals"} variant="outlined" clickable/>
              <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"Soups"} variant="outlined" clickable/>
              <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"Side Dish"} variant="outlined" clickable/>
              <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"Beverages"} variant="outlined" clickable/>
            </Grid>

            {/* Your product cards */}
            <Grid size={12} container spacing={2} className="item-content">
              <Grid size={3}>
                <ProductCard isItemCard={true}/>
              </Grid>
              <Grid size={3}>
                <ProductCard isItemCard={true}/>
              </Grid>
              <Grid size={3}>
                <ProductCard isItemCard={true}/>
              </Grid>
              <Grid size={3}>
                <ProductCard isItemCard={true}/>
              </Grid>
              
            </Grid>
          </Grid>
        </Grid>

        {/* Checkout area */}
        <Grid size={4} paddingLeft={4} paddingRight={8} paddingTop={5}>
          <Grid size={12} className={"checkout-outer"} paddingTop={5} paddingLeft={3} paddingRight={3} borderRadius={5} paddingBottom={5}>
            <Grid size={12} className="order-summery-head">
              <span>Order's summary</span>
              <p>#219021</p>
              <hr className='hr'/>
              <span className='heading-total'>Cart items <span>(2)</span></span>
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
  );
}

export default Item;
