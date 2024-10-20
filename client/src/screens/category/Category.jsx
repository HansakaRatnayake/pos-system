import React from 'react';
import './Category.css';

import Grid from '@mui/material/Grid2';


function Category() {
  return (
    <div className='category-main-outer'>
        <Grid className='category-main-grid' container spacing={4} paddingLeft={8} paddingTop={6} paddingRight={8} paddingBottom={6}>
            <Grid size={12}>
              <span className='category-head'>Food Categories</span>
            </Grid>

            <Grid size={12} container spacing={2}>
            <Grid size={{lg:6, md:6, sm:12,xs:12}}>
               <div className="category-card">
                  <img src='https://tb-static.uber.com/prod/image-proc/processed_images/36cfd2b09a41f7f85479ed2d0c69140a/16bb0a3ab8ea98cfe8906135767f7bf4.jpeg' alt='image1'/>
                  <div className="category-name">
                    Asian Fusion
                  </div>
               </div>
            </Grid>
            <Grid size={{lg:6, md:6, sm:12,xs:12}} >
               <div className="category-card">
                  <img src='https://tb-static.uber.com/prod/image-proc/processed_images/134f56a94c8fb32271b9662b66ddc726/50446f64f31cbefe66558fc47f50a9d6.jpeg' alt='image2'/>
                  <div className="category-name">
                    Chinees
                  </div>
               </div>
            </Grid>
            <Grid size={{lg:6, md:6, sm:12,xs:12}} >
               <div className="category-card">
                  <img src='https://tb-static.uber.com/prod/image-proc/processed_images/c84fa0898edb0aafaef9d9f845171917/719c6bd2757b08684c0faae44d43159d.jpeg' alt='image3'/>
                  <div className="category-name">
                    Burgers
                  </div>
               </div>
            </Grid>
            <Grid size={{lg:6, md:6, sm:12,xs:12}} >
               <div className="category-card">
                  <img src='https://tb-static.uber.com/prod/image-proc/processed_images/be50b2e5642ee96ac02b240daf41776c/16bb0a3ab8ea98cfe8906135767f7bf4.webp' alt='image4'/>
                  <div className="category-name">
                   Spanish
                  </div>
               </div>
            </Grid>
            <Grid size={{lg:6, md:6, sm:12,xs:12}} >
               <div className="category-card">
                  <img src='https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/11/03/GettyImages-1310175224_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1635974200968.jpeg' alt='image5'/>
                  <div className="category-name">
                    Fast Foods
                  </div>
               </div>
            </Grid>
            <Grid size={{lg:6, md:6, sm:12,xs:12}} >
               <div className="category-card">
                  <img src='https://tb-static.uber.com/prod/image-proc/processed_images/96be8b5b9720bc434084cb37175d451f/3ac2b39ad528f8c8c5dc77c59abb683d.jpeg' alt='image6'/>
                  <div className="category-name">
                    Italian
                  </div>
               </div>
            </Grid>
           

        </Grid>
        </Grid>
       
    </div>
  )
}

export default Category