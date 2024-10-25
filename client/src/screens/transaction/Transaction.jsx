import { Box, Button, Dialog, Grid, Grid2, TextField } from '@mui/material';
import axios from 'axios';
import React, { useContext, useEffect, useState } from 'react'
import TableComponent from '../../components/tablecomponent/TableComponent';
import './Transaction.css';

import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import TurnedInOutlinedIcon from '@mui/icons-material/TurnedInOutlined';
import AddCircleOutlinedIcon from '@mui/icons-material/AddCircleOutlined';
import { UserContext } from '../../hooks/UserContext';
import UserAddForm from '../../components/user-form/UserAddForm';

const baseURL = process.env.REACT_APP_API_URL;

const Transaction = () => {

  const [transaction, setTransaction] = useState([]);
  const {user} = useContext(UserContext);
  const [open, setOpen] = React.useState(false);
  const [search, setSearch] = useState('');

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleCreateFormClose = (action) => {
    setOpen(action);
  }

  const handleSearch = (event) => {
    // setSearch(event.target.value); 
    
    // axios.get(`${baseURL}/transactions?username=${search}`, { withCredentials: true }).then(res => {
    //   console.log(res.data);
    //   setTransaction(res.data);
    // }).catch(err => console.log("Items fetching error : " + err));
    
  }

  useEffect(() => {
    axios.get(`${baseURL}/transactions`, { withCredentials: true }).then(res => {
      console.log(res.data);
      setTransaction(res.data);
    }).catch(err => console.log("Items fetching error : " + err));
  }, []);

  const columns = ['#Id', 'ItemCode', 'User', 'Date', 'Total'];
  // const data = users;

  return (
    <Grid2 container display={'flex'}>

      {/* <Grid2 size={12} sx={{marginTop:"3rem"}} className={"menu-item-head"} >
        
        
         
          <TextField
            label={<span><SearchOutlinedIcon className='search-icon' /> Search</span>}
            className='txtsearch'
            value={search}
            onChange={handleSearch}
            type="text"
            size="small"
          />

       
      </Grid2> */}

      <Grid2 size={12} sx={{marginTop:"3rem"}}>
        <span >Transaction details</span>
        <Box sx={{ width: '100%', marginTop: '2rem' }}>
          <Grid2 container overflow={'auto'} maxHeight={600}>
            <Grid2 item xs={12}>
              <TableComponent columns={columns} data={transaction} />
            </Grid2>
          </Grid2>
        </Box>
      </Grid2>

      <Dialog
          open={open}
          onClose={handleClose}
        >
      <UserAddForm onCreateFormClose={handleCreateFormClose}/>
      </Dialog>
    </Grid2>


  )
}

export default Transaction