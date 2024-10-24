import React, { useEffect, useState } from 'react';
import './Stock.css';

import Grid from '@mui/material/Grid2';
import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import TurnedInOutlinedIcon from '@mui/icons-material/TurnedInOutlined';

import ProductCard from '../../components/product-card/ProductCard';
import OrderCard from '../../components/order-card/OrderCard';
import PaymentCard from '../../components/payment-card/PaymentCard';

import Chip from '@mui/material/Chip';
import TextField from '@mui/material/TextField';
import { Button } from '@mui/material';
import axios from 'axios';
import RandomCodeGenerator from '../../utils/RandomCodeGenataror';

const Stock = () => {

  const baseURL = process.env.REACT_APP_API_URL;

  const [isClickSearchBtn, setIsClickSearchBtn] = useState(true); 
  const [search, setSearch] = useState('');
  const [cart, setCart] = useState([]);
  const [isHaveCartItem, setIsHaveCartItem] = useState(false);
  const [cartItemCount, setCartItemCount] = useState(cart.length);
  const [isRemoveFromCart, setIsRemoveFromCart] = useState(false);
  const [itemlist, setItemlist] = useState([]);

  const [categories, setCategories] = useState([]);
  
  const handleSearchBtn = () => {
    setIsClickSearchBtn(!isClickSearchBtn);
  }

  const handleSearch = (event) => {
    let searchText = event.target.value;
    // setSearch(event.target.value); 
    let searchCategoryId = -1;
    
  }

  const handleItem = (orderItem) => {
     console.log(cart.length);
     let selecteditm = -1;
     
     if(cart.length > 0) {
      selecteditm = cart.findIndex(citm=>citm.id === orderItem.id);
      
     }
     if (selecteditm !== -1) {
        const temp = cart;
        temp[selecteditm] = orderItem;
        setCart([...temp]);
     }else{

      orderItem.name?  setCart([...cart,orderItem]) : setCart([...cart]);
       
     }
     
  }


  const fetchItemData = () => {
    axios.get(`${baseURL}/items`,{withCredentials: true}).then(res => {
      console.log(res.data);
      setItemlist(res.data); 
    }).catch(err => console.log("Items fetching error : "+ err));
  }


  const fetchCategoryData = () => {
    axios.get(`${baseURL}/categories`,{withCredentials: true}).then(res => {
      console.log(res.data);
      setCategories(res.data); 
    }).catch(err => console.log("Categories fetching error : "+ err));
  }



  const handleDeleteFromCart = (deleteItem) =>{
    
    const selectedItemArr = cart.filter(citm => citm.id  !== deleteItem.id);  
    setCart([...selectedItemArr]);
    setIsRemoveFromCart(!isRemoveFromCart);
  }


  useEffect(()=>{
    setCartItemCount(cart.length);
  },[cart]);

  useEffect(() => {
    fetchItemData();
    fetchCategoryData();
  }, []);




  return (
    <div className={'item-main-outer'}>
      <Grid className={"main-grid"} container spacing={2} >
        <Grid size={8} paddingLeft={8} paddingTop={10}>
          <Grid size={12} container spacing={2}>
            <Grid size={12} className={"menu-item-head"}>
              <span>Menu Item <span>({itemlist.length})</span></span>
              <div className="menu-option">
                
                  <TextField
                    label={<span><SearchOutlinedIcon className='search-icon' /> Search By Name</span>}
                    className='txtsearch'
                    value={search} 
                    onChange={handleSearch}
                    type="text"
                    size="small"
                  />

              </div>
            </Grid>

            {/* Other sections of your UI */}
            <Grid size={12} className={"menu-item-categories"}>

            <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={"All"} variant="outlined" clickable key={-1} />

              {categories.map((category, index) =>(
                <Chip icon={<TurnedInOutlinedIcon className='lunchDining-icon'/>} label={category.name} variant="outlined" clickable key={index} onClick={()=>{console.log(category);
                }}/>
              ))
              }
            </Grid>

            {/* Your product cards */}
            <Grid size={12} container spacing={2} className="item-content">
              {itemlist.map((itm, index) => (
                <Grid size={3} key={index}>
                  <ProductCard isItemCard={false} onItem={handleItem} item={itm} isRemoveFromCart={isRemoveFromCart} key={index}/>
                </Grid>
              ))}
             
              
            </Grid>
          </Grid>
        </Grid>

        {/* Checkout area */}
        <Grid size={4} paddingLeft={4} paddingRight={8} paddingTop={5}>
          <Grid size={12} className={"checkout-outer"} paddingTop={5} paddingLeft={3} paddingRight={3} borderRadius={5} paddingBottom={5}>
            <Grid size={12} className="order-summery-head">
              <span>Purchase Order summary</span>
              <p>#{RandomCodeGenerator()}</p>
              <hr className='hr'/>
              <span className='heading-total'>Cart items <span>({cartItemCount})</span></span>
            </Grid>

            <Grid size={12} className="order-summery-list" gap={2}>
              <Grid size={12} container spacing={1} className="order-card-list-outer">
                {cart.length > 0 && cart.length >= cartItemCount ?( cart.map((itm, index) => (
                   <OrderCard cartItem={itm} key={index} onOrderRemove={handleDeleteFromCart}/>
                ))
              ):(
                <>
                  <span className='cart-is-empty-outer'>Cart is Empty</span>
                </>
              )
              }
                
              </Grid>
            </Grid>

            <Grid size={12} className="order-summery-payment">
              <PaymentCard item={cart}/>
            </Grid>
            <Grid size={12} className="proceed-btn-outer">
              {/* <span className='place-order-btn'>Place Order</span> */}
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

export default Stock;
