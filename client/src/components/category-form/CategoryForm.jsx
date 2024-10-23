import React, { useEffect, useState } from 'react';
import Button from '@mui/material/Button';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import Grid from '@mui/material/Grid2';
import axios from "axios";
import toast from "react-hot-toast";
import {MenuItem, TextField}  from '@mui/material';
import RandomCodeGenerator from '../../utils/RandomCodeGenataror';
import { useNavigate } from 'react-router-dom';


const baseUrl = process.env.REACT_APP_API_URL;


const CategoryAddForm = ({onCreateFormClose}) => {

  const [category, setCategory] = useState({
    name:'',
  })

  const navigate = useNavigate();


  const handleSubmit = (event) => {
    event.preventDefault();
    
    const obj = {...category}
    console.log(obj);
    

    axios.post(`${baseUrl}/categories`, obj,{withCredentials: true})
      .then(res => {
        console.log(res);
        toast.success("Category Successfully Saved");
        handleCancel();
        navigate('/category');
      })
      .catch(err => {
        toast.error("Somthig Error.Try again");
      });
  }

  const handleInputFieldChange = (e) => {
     const {name, value } = e.target;
     setCategory({...category,[name]:value});

  }

  const handleCancel = () => {
    onCreateFormClose(false)
  }

  return (
    <div>
      <DialogTitle>Add New Category</DialogTitle>
      <DialogContent>
        <form onSubmit={handleSubmit}>
            <Grid container spacing={1} className="mt-2">
              <Grid size={12}>
                <TextField
                  name="name"
                  label="Category Name"
                  margin="dense"
                  fullWidth
                  size="medium"
                  value={category.name}
                  onChange={handleInputFieldChange}
                />              
              </Grid>
              
              <Grid size={12} container spacing={1} justifyContent={'end'} marginTop={1}>
                <Grid item xs={6}>
                  <Button variant="outlined"  color='error' type='button' onClick={handleCancel}>Clear</Button>
                </Grid>
                <Grid item xs={6}>
                <Button variant="outlined" color='primary' type='submit' >Create</Button>
                </Grid>
                
              </Grid>
              
            </Grid>
        </form>
      </DialogContent>
    </div>
  );
}

export default CategoryAddForm;
