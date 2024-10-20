import React, { useEffect, useState } from 'react'
import './ProductCard.css';

import Grid from '@mui/material/Grid2';
import Chip from '@mui/material/Chip';

import CheckCircleOutlineRoundedIcon from '@mui/icons-material/CheckCircleOutlineRounded';
import AddRoundedIcon from '@mui/icons-material/AddRounded';
import RemoveRoundedIcon from '@mui/icons-material/RemoveRounded';
import Inventory2OutlinedIcon from '@mui/icons-material/Inventory2Outlined';

import TextField from '@mui/material/TextField';


function ProductCard({isStockCard, isItemCard, item}) {

    const [stockcard,setStockCard] = useState(isStockCard);
    const [itemcard,settemCard] = useState(isItemCard);
    const [isPOrder, setIsPOrder] = useState(false);
    const [qty, setQty] = useState(10);
    const [isItemOrder, setIsItemOrder] = useState(false);
    const [itemQty, setItemQty] = useState(1);
    const [isSubDisable, setIsSubDisable] = useState(false);
    const [cartItem, setCartItem] = useState(null);

    const handleQtyChange = (event) => {
        setQty(event.target.value)
    }

    const handlePOrderBtnChange = () => {
        setIsPOrder(true);
        setCartItem({name:});
    }

    const handleAddToCart = () => {
        setIsItemOrder(!isItemOrder);

       
    }

    useEffect(()=>{
        if(itemQty <= 1) setIsSubDisable(true);
        if(itemQty > 1) setIsSubDisable(false);

    },[itemQty]);


  return (
    <div className='product-main-outer'>
        <Grid columns={1} container spacing={3} padding={2}>
            <Grid size={12} className="image-outer">
                <img src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/1/23/0/FN_healthy-fast-food-red-robin-avocado-cobb-salad_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1516723515457.jpeg" alt="product-name" />
            </Grid>
            {isItemCard ? (
                <>
                    <Grid size={12} className="name-price-outer">
                        <span>Spicy Chiken Tendon</span>
                        <span className='price'>($25.0)</span>
                    </Grid>

                    <Grid size={12} className="option-outer">

                    {isItemOrder ? (
                        <>
                            <Chip
                            label={<span className='choose-outer'>Choose <span><CheckCircleOutlineRoundedIcon className='check-icon'/></span></span>}     
                            color='primary'
                            sx={{width:"50%"}}
                            clickable
                            onClick={()=>{setIsItemOrder(!isItemOrder)}}
                    
                            />
                            <Chip
                                label={
                                    <span className='qty-outer'>
                                        
                                        {!isSubDisable ? (
                                            <>
                                                <span className='sub-btn-outer' onClick={()=>{setItemQty(itemQty-1)}} >
                                                    <RemoveRoundedIcon className='sub-btn'/>
                                                </span>
                                            </>
                                        ):(
                                            <>
                                                <span className='sub-btn-outer'>
                                                    <RemoveRoundedIcon className='sub-btn'/>
                                                </span>
                                            </>
                                        )
                                        }
                                        {itemQty}
                                        <span className='add-btn-outer' onClick={()=>{setItemQty(itemQty+1)}}>
                                            <AddRoundedIcon className='add-btn'/>
                                        </span>
                                        
                                    </span>
                                    }
                                sx={{width:"50%"}}
                            />

                        </>
                    ):(
                        <>
                            <Chip
                            label={<span className='choose-outer'>Add To Cart</span>}     
                            color='primary'
                            sx={{width:"100%"}}
                            variant='outlined'
                            clickable
                            onClick={handleAddToCart}
                            
                            />
                        </>
                    )
                    }

                        
                    </Grid>
                </>

            ):(
                <>
                    <Grid size={12} className="name-price-outer">
                        <span>Spicy Chiken Tendon <span>($25.0)</span></span>
                    </Grid>
                    <Grid size={12} className="option-outer">
                        <Chip
                            label={<span className='choose-outer'><span><Inventory2OutlinedIcon className='stock-icon'/> Stock : 130</span></span>}     
                            color='success'
                            sx={{width:"50%"}}
                        />
                        <Chip
                            label={<span className='pop-outer'><span>PO Price : $200</span></span>}
                            sx={{width:"50%"}}
                        />
                    </Grid>
                    <Grid size={12} container spacing={2} className="option-outer">
                        
                        {isPOrder ? (
                            <>
                                <Grid size={12}>
                                    <span className='input-qty-outer'>
                                        <span>
                                            <TextField
                                                 required
                                                 id="outlined-required"
                                                 label="Enter QTY"
                                                 className='txtQty'
                                                 value={qty} 
                                                 onChange={handleQtyChange}
                                                 type="number"
                                            />
                                            {/* QTY : <input type="number" className='txtQty' value={qty} onChange={handleQtyChange} />  */}
                                        </span>
                                    </span>

                                </Grid>
                                <Grid size={12}>
                                    <Chip
                                        label={<span className='btn-cart-outer'><span>Add To Cart</span></span>}     
                                        color='success'
                                        clickable
                                        onClick={handlePOrderBtnChange}
                                        sx={{width:"100%"}}
                                    />

                                </Grid>
                                
                            </>
                        ):
                        (
                            <>
                                <Chip
                                    label={<span className='po-outer'><span>Purchase Order</span></span>}     
                                    color='success'
                                    clickable
                                    onClick={handlePOrderBtnChange}
                                    sx={{width:"100%"}}
                                />
                            </>
                        )
                        }
                       
                    </Grid>
                </>
            )
            }
            

        </Grid>
    </div>
  )
}

export default ProductCard