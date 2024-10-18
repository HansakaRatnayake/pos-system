import React from 'react'
import './ProductCard.css';

import Grid from '@mui/material/Grid2';
import Chip from '@mui/material/Chip';

import CheckCircleOutlineRoundedIcon from '@mui/icons-material/CheckCircleOutlineRounded';
import AddRoundedIcon from '@mui/icons-material/AddRounded';
import RemoveRoundedIcon from '@mui/icons-material/RemoveRounded';

function ProductCard() {
  return (
    <div className='product-main-outer'>
        <Grid columns={1} container spacing={3} padding={2}>
            <Grid size={12} className="image-outer">
                <img src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/1/23/0/FN_healthy-fast-food-red-robin-avocado-cobb-salad_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1516723515457.jpeg" alt="product-name" />
            </Grid>

            <Grid size={12} className="name-price-outer">
                <span>Spicy Chiken Tendon <span>($25.0)</span></span>
            </Grid>
            <Grid size={12} className="option-outer">
                <Chip
                    label={<span className='choose-outer'>Choose <span><CheckCircleOutlineRoundedIcon className='check-icon'/></span></span>}     
                    color='primary'
                    sx={{width:"50%"}}
                />
                <Chip
                    label={<span className='qty-outer'><span className='add-btn-outer'><AddRoundedIcon className='add-btn'/></span>0<span className='sub-btn-outer' ><RemoveRoundedIcon className='sub-btn'/></span></span>}
                    sx={{width:"50%"}}
                />
            </Grid>

        </Grid>
    </div>
  )
}

export default ProductCard