import React, { useEffect, useState } from 'react'
import './ProductCard.css';



import Grid from '@mui/material/Grid2';
import Chip from '@mui/material/Chip';

import CheckCircleOutlineRoundedIcon from '@mui/icons-material/CheckCircleOutlineRounded';
import AddRoundedIcon from '@mui/icons-material/AddRounded';
import RemoveRoundedIcon from '@mui/icons-material/RemoveRounded';
import Inventory2OutlinedIcon from '@mui/icons-material/Inventory2Outlined';

import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';

import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';


function ProductCard({onItem, isStockCard, isItemCard, item, isRemoveFromCart}) {

    const [stockcard,setStockCard] = useState(isStockCard);
    const [itemcard,settemCard] = useState(isItemCard);
    const [isPOrder, setIsPOrder] = useState(false);
    const [qty, setQty] = useState(0);
    const [isItemOrder, setIsItemOrder] = useState(false);
    // const [itemQty, setItemQty] = useState(1);
    const [isSubDisable, setIsSubDisable] = useState(false);
    const [cartItem, setCartItem] = useState({});
    // const [removeFromCart, setRemoveFromCart] = useState(false);
   
    

    const handleQtyChange = (event) => {
        setQty(event.target.value)
    }

    const handlePOrderBtnChange = () => {
        setIsPOrder(true);
    }

    const handleAddToCart = () => {
        setIsItemOrder(!isItemOrder);
        handleQtyAdd();
        // setCartItem({...item, qty});
  
    }

    const handleQtyAdd = () => {
        setQty(qty+1);
    }

    const handleQtySub = () => {
        setQty(qty-1);
    }

    useEffect(()=>{
        if(qty <= 1) setIsSubDisable(true);
        if(qty > 1) setIsSubDisable(false);

        if(qty > 0) setCartItem({...item, qty});

    },[qty]);

    useEffect(() => {
        onItem(cartItem);
    },[cartItem]);

    useEffect(()=>{

        if(isRemoveFromCart) setIsItemOrder(false);

    },[isRemoveFromCart])



  return (
    <div className='product-main-outer'>
        <Grid columns={1} container spacing={3} padding={2}>
            <Grid size={12} className="image-outer">
                <img className='product-image' src={item.photo} alt="product-name" />
                <div className="image-buttons">
                        <Button className='btn-edit' variant='contained' startIcon={<EditIcon />}>
                            Edit
                        </Button>
                        <Button className='btn-delete' variant='contained' color='error' startIcon={<DeleteIcon/>}>
                            Delete
                        </Button>
                        
                </div>
            </Grid>
            {isItemCard ? (
                <>
                    <Grid size={12} className="name-price-outer">
                        <span>{item.name}</span>
                        <span className='price'>${item.price.toFixed(2)}</span>
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
                                                <span className='sub-btn-outer' onClick={handleQtySub} >
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
                                        {qty}
                                        <span className='add-btn-outer' onClick={handleQtyAdd}>
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