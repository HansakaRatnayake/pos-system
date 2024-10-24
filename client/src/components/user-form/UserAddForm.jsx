import { Button, DialogContent, DialogTitle, Grid2, MenuItem, TextField } from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react'
import toast from 'react-hot-toast';
import { useNavigate } from 'react-router-dom';

const baseUrl = process.env.REACT_APP_API_URL;

const UserAddForm = ({onCreateFormClose}) => {

    const [user, setUser] = useState({
        username: '',
        password: '',
        email: '',
        mobile: '',
        userstatus: {},
        role:{}
      });

      const [userstatusList, setUserStatusList] = useState([]);
      const [roleList, setRoleList] = useState([]);

      const navigate = useNavigate();

      useEffect(() => {

        const fetchUserStatsData = () => {
          axios.get(`${baseUrl}/userstatuses`, { withCredentials: true }).then(res => {
            console.log(res.data);
            setUserStatusList(res.data);
          }).catch(err => console.log("UserStatus fetching error : " + err));
        }

        const fetchRoleData = () => {
            axios.get(`${baseUrl}/roles`, { withCredentials: true }).then(res => {
              console.log(res.data);
              setRoleList(res.data);
            }).catch(err => console.log("Role fetching error : " + err));
          }
    
        fetchUserStatsData();
        fetchRoleData();
      }, []);

      const handleSubmit = (event) => {
        event.preventDefault();
            
        const obj = { ...user }
        console.log(obj);
    
        axios.post(`${baseUrl}/users`, obj, { withCredentials: true })
          .then(res => {
            console.log(res);
            toast.success("User Successfully Added!");
            handleCancel();
            setTimeout(() => { window.location.reload(); }, 2000)
          })
          .catch(err => {
            toast.error("Something Error.Try again");
          });
      }

      const handleInputFieldChange = (e) => {
        const { name, value } = e.target;
        setUser({ ...user, [name]: value });
    
      }

      const handleUserStatusChange = (event) => {
        const selectedUserStatus = userstatusList.find(userstatus => userstatus.id === event.target.value);
        setUser(prevUser => ({
          ...prevUser,
          userstatus: selectedUserStatus  // Set the entire userstatus object
        }));
      }

      const handleRoleChange = (event) => {
        const selectedRole = roleList.find(role => role.id === event.target.value);
        setUser(prevUser => ({
          ...prevUser,
          role: selectedRole  // Set the entire role object
        }));
      }

      const handleCancel = () => {
        onCreateFormClose(false)
      }

    
  return (
    <div>
      <DialogTitle>Add User</DialogTitle>
      <DialogContent>
        <form onSubmit={handleSubmit}>
            <Grid2 container spacing={1} className="mt-2">
              <Grid2 size={12}>
                <TextField
                  name="username"
                  label="Username"
                  margin="dense"
                  fullWidth
                  size="medium"
                  value={user.username}
                  onChange={handleInputFieldChange}
                />              
              </Grid2>

                <Grid2 size={12}>
                  <TextField
                    name="password"
                    label="Password"
                    type="password"
                    margin="dense"
                    fullWidth
                    size="medium"
                    value={user.password}
                    onChange={handleInputFieldChange}
                  />
                </Grid2>

                <Grid2 size={12}>
                  <TextField
                    name="mobile"
                    label="Mobile"
                    type="text"
                    margin="dense"
                    fullWidth
                    size="medium"
                    value={user.mobile}
                    onChange={handleInputFieldChange}
                  />
                </Grid2>

                <Grid2 size={12}>
                  <TextField
                    name="email"
                    label="Email"
                    type="email"
                    margin="dense"
                    fullWidth
                    size="medium"
                    value={user.email}
                    onChange={handleInputFieldChange}
                  />
                </Grid2>

                <Grid2 size={12} container>
                <Grid2 size={6}>
                <TextField
                  select
                  name="userstatus"
                  label="UserStatus"
                  margin="dense"
                  fullWidth
                  size="medium"
                  value={user.userstatus.id || ''}  // Reference the category id for the selected value
                  onChange={handleUserStatusChange}  // Handle category change
                >
                  {userstatusList.map((option, index) => (
                    <MenuItem key={index} value={option.id}>
                      {option.name}  {/* Display category name */}
                    </MenuItem>
                  ))}
                </TextField>
                </Grid2>

                <Grid2 size={6}>
                <TextField
                  select
                  name="role"
                  label="Role"
                  margin="dense"
                  fullWidth
                  size="medium"
                  value={user.role.id || ''}  // Reference the role id for the selected value
                  onChange={handleRoleChange}  // Handle role change
                >
                  {roleList.map((option, index) => (
                    <MenuItem key={index} value={option.id}>
                      {option.name}  {/* Display category name */}
                    </MenuItem>
                  ))}
                </TextField>
                </Grid2>
                
              </Grid2>

              
              <Grid2 size={12} container spacing={1} justifyContent={'end'} marginTop={1}>
                <Grid2 item xs={6}>
                  <Button variant="outlined"  color='error' type='button' onClick={handleCancel}>Clear</Button>
                </Grid2>
                <Grid2 item xs={6}>
                <Button variant="outlined" color='primary' type='submit' >Create</Button>
                </Grid2>
                
              </Grid2>
              
            </Grid2>
        </form>
      </DialogContent>
    </div>
  )
}

export default UserAddForm