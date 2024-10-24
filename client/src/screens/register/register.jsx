import { Box, Button, Dialog, Grid, Grid2, TextField } from '@mui/material';
import axios from 'axios';
import React, { useContext, useEffect, useState } from 'react'
import TableComponent from '../../components/tablecomponent/TableComponent';

import SearchOutlinedIcon from '@mui/icons-material/SearchOutlined';
import FilterAltIcon from '@mui/icons-material/FilterAlt';
import TurnedInOutlinedIcon from '@mui/icons-material/TurnedInOutlined';
import AddCircleOutlinedIcon from '@mui/icons-material/AddCircleOutlined';
import { UserContext } from '../../hooks/UserContext';
import UserAddForm from '../../components/user-form/UserAddForm';

const baseURL = process.env.REACT_APP_API_URL;

const Register = () => {

  const [users, setUsers] = useState([]);
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
    setSearch(event.target.value); 
    
    axios.get(`${baseURL}/users?username=${search}`, { withCredentials: true }).then(res => {
      console.log(res.data);
      setUsers(res.data);
    }).catch(err => console.log("Items fetching error : " + err));
    
  }

  useEffect(() => {
    axios.get(`${baseURL}/users`, { withCredentials: true }).then(res => {
      console.log(res.data);
      setUsers(res.data);
    }).catch(err => console.log("Items fetching error : " + err));
  }, []);

  const columns = ['Username', 'Mobile', 'Email', 'UserStatus', 'Role', 'Action'];
  const data = users;

  return (
    <div>

      <Grid2 size={12} sx={{marginTop:"3rem"}} className={"menu-item-head"}>
        <div className="menu-option">

          <TextField
            label={<span><SearchOutlinedIcon className='search-icon' /> Search By Username</span>}
            className='txtsearch'
            value={search}
            onChange={handleSearch}
            type="text"
            size="small"
          />
          {user.role.name === "Admin" || user.role.name === "Manager" ? (
            <>
              <Button variant="contained" color='primary' startIcon={<AddCircleOutlinedIcon />} onClick={handleClickOpen}>New User</Button>
            </>
          ) : (
            <></>
          )}

        </div>
      </Grid2>

      <Box sx={{ width: '100%', marginTop: '2rem' }}>
        <Grid2 container>
          <Grid2 item xs={12}>
            <TableComponent columns={columns} data={data} />
          </Grid2>
        </Grid2>
      </Box>

      <Dialog
          open={open}
          onClose={handleClose}
        >
      <UserAddForm onCreateFormClose={handleCreateFormClose}/>
      </Dialog>
    </div>


  )
}

export default Register