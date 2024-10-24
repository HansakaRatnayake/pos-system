import React, { useEffect, useState } from 'react';
import './Category.css';
import {Typography, Card, CardContent, Button, IconButton, TextField } from '@mui/material';
import SearchIcon from '@mui/icons-material/Search';
import NotificationsIcon from '@mui/icons-material/Notifications';
import Avatar from '@mui/material/Avatar';
import axios from 'axios';
import Dialog from '@mui/material/Dialog';
import Grid from '@mui/material/Grid2';
import CategoryAddForm from '../../components/category-form/CategoryForm';




const Category = () => {

   const baseURL = process.env.REACT_APP_API_URL;

   const [categories, setCategories] = useState([]);
   const [open, setOpen] = React.useState(false);

   const handleClickOpen = () => {
     setOpen(true);
   };
 
   const handleClose = () => {
     setOpen(false);
   };
   

    const fetchCategoryData = () => {
      axios.get(`${baseURL}/categories`,{withCredentials: true}).then(res => {
        console.log(res.data);
        setCategories(res.data); 
      }).catch(err => console.log("Categories fetching error : "+ err));
    }

    const handleCreateFormClose = (action) => {
      setOpen(action);
      fetchCategoryData();
    }

    useEffect(()=>{
      fetchCategoryData();
    },[]);

 
  return (
    <div className="categories-ui-container">
     

      {/* Search Section */}


      {/* Categories Section */}
      <section className="categories-section">
        
        <Grid container spacing={3}>
          {categories.map((category, index) => (
            <Grid item xs={12} sm={6} md={4} key={index}>
              <Card className="category-card">
                <CardContent>
                  <Typography variant="h6" className="category-name">
                    {category.name}
                  </Typography>
                </CardContent>
              </Card>
            </Grid>
          ))}
          
        </Grid>
        <Button variant='outlined' color='secondary' onClick={handleClickOpen}>Add New Category</Button>
      </section>

      <Dialog
          open={open}
          onClose={handleClose}
      >
         <CategoryAddForm onCreateFormClose={handleCreateFormClose}/>
            
      </Dialog>

    </div>
  );
}

export default Category;
