import React, { useEffect, useState } from 'react';
import Button from '@mui/material/Button';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import Grid from '@mui/material/Grid2';
import axios from "axios";
import toast from "react-hot-toast";
import "./ItemAddForm.css";
import {MenuItem, TextField}  from '@mui/material';
import RandomCodeGenerator from '../../utils/RandomCodeGenataror';
import { useNavigate } from 'react-router-dom';


const baseUrl = process.env.REACT_APP_API_URL;


const ItemUpdateForm = ({onCreateFormClose, oldItem}) => {

  const [item, setItem] = useState({
    name:'',
    price:0,
    photo:'',
    category:'',
    code:''
  })

  const [photo, setPhoto] = useState(null);
  const [photoPreview, setPhotoPreview] = useState(null);
  const [showUpload, setShowUpload] = useState(true);
  const [categoryList, setCategoryList] = useState([]);

  const navigate = useNavigate();

  useEffect(()=>{
    setShowUpload(false);
    setPhotoPreview(oldItem.photo);
    setItem({
      name:oldItem.name,
      price:oldItem.price,
      photo:oldItem.photo,
      category:oldItem.category.name,
      code:oldItem.code
    })
  },[oldItem])




  useEffect(() => {

  const fetchCategoryData = () => {
    axios.get(`${baseUrl}/categories`,{withCredentials: true}).then(res => {
      console.log(res.data);
      setCategoryList(res.data); 
    }).catch(err => console.log("Categories fetching error : "+ err));
  }

  fetchCategoryData();
  }, []);



  const handlePhotoChange = (event) => {
    setPhoto(event.target.files[0]);
    setShowUpload(false);
    handlePhotoPreview(event.target.files[0]);
  }

  const handlePhotoPreview = (file) => {
    const reader = new FileReader();
    reader.onloadend = () => {
      setPhotoPreview(reader.result);
    };
    reader.readAsDataURL(file);
  }

  const handleSubmit = (event) => {
    event.preventDefault();
    const code = RandomCodeGenerator();
    // console.log(code);
    
    const obj = {...item,code,photo:photoPreview?photoPreview.split(',')[1]:''}
    console.log(obj);
    
    axios.put(`${baseUrl}/items`, obj,{withCredentials: true})
      .then(res => {
        console.log(res);
        toast.success("Item Successfully Updated!");
        handleCancel();
        setTimeout(()=>{window.location.reload();},2000)
      })
      .catch(err => {
        toast.error("Somthig Error.Try again");
      });
  }

  const handleInputFieldChange = (e) => {
     const {name, value } = e.target;
     setItem({...item,[name]:value});

  }

  const handleCancel = () => {
    onCreateFormClose(false)
  }

  return (
    <div>
      <DialogTitle>Add New Item</DialogTitle>
      <DialogContent>
        <form onSubmit={handleSubmit}>
            <Grid container spacing={1} className="mt-2">
              <Grid size={12}>
                <TextField
                  name="name"
                  label="Item Name"
                  margin="dense"
                  fullWidth
                  size="medium"
                  value={item.name}
                  onChange={handleInputFieldChange}
                />              
              </Grid>

              <Grid size={12} container>
                <Grid size={6}>
                  <TextField
                    name="price"
                    label="Item Price"
                    type="number"
                    margin="dense"
                    fullWidth
                    size="medium"
                    value={item.price}
                    onChange={handleInputFieldChange}
                  />
                </Grid>
                <Grid size={6}>
                  <TextField
                    select
                    name="category"
                    label="Item Category"
                    margin="dense"
                    fullWidth
                    size="medium"
                    value={item.category}
                    onChange={handleInputFieldChange}
                  >
                    {categoryList.map((option, index) => (
                    <MenuItem key={index} value={option.name}>
                      {option.name}
                    </MenuItem>
                  ))}
                  </TextField>
                </Grid>
                
              </Grid>

         

              <Grid size={12}>
                <label className="file-upload">
                  <div className={`file-upload-box ${showUpload ? 'show' : 'hide'}`}>
                    {showUpload ? (
                      <div className="upload-prompt">
                        <svg className="upload-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 16">
                          <path stroke="currentColor" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2" />
                        </svg>
                        <p>Click to upload Item image</p>
                        <p>SVG, PNG, JPG or GIF (MAX. 800x400px)</p>
                      </div>
                    ) : (
                      <div className="image-preview">
                        <img src={photoPreview.startsWith('data') ? photoPreview : `data:image/png;base64,${photoPreview}`} alt="itempic" />
                      </div>
                    )}
                    <input type="file" name="photo" className="file-input" onChange={handlePhotoChange} />
                  </div>
                </label>

              </Grid>
              
              <Grid size={12} container spacing={1} justifyContent={'end'} marginTop={1}>
                <Grid item xs={6}>
                  <Button variant="outlined"  color='error' type='button' onClick={handleCancel}>Clear</Button>
                </Grid>
                <Grid item xs={6}>
                <Button variant="outlined" color='primary' type='submit' >Update</Button>
                </Grid>
                
              </Grid>
              
            </Grid>
        </form>
      </DialogContent>
    </div>
  );
}

export default ItemUpdateForm;
