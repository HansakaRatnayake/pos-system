import React from 'react'
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import { Button, Dialog } from '@mui/material';
import UserEditForm from '../user-form/UserEditForm';
import axios from 'axios';
import toast from 'react-hot-toast';

const baseUrl = process.env.REACT_APP_API_URL;

const TableComponent = ({ columns, data }) => {

    const [open, setOpen] = React.useState(false);
    const [selectedUser, setSelectedUser] = React.useState([]);

    const handleDelete = (id) => {
        const confirm = window.confirm("Are you sure you want to delete?")
        if (confirm) {
            axios.delete(`${baseUrl}/users/${id}`, { withCredentials: true })
                .then(() => {
                    toast.success("User Successfully Deleted!");
                    setTimeout(() => { window.location.reload(); }, 2000)
                })
                .catch(err => {
                    console.log(err);
                    toast.error("Error on delete..Try again");
                });
    }}

    const handleClickOpen = () => {
        setOpen(true);
      };

      const handleClose = () => {
        setOpen(false);
      };

      const handleCreateFormClose = (action) => {
        setOpen(action);

    }

    return (
        <div>
        <TableContainer component={Paper}>
            <Table sx={{ minWidth: 650 }} aria-label="simple table">
                <TableHead>
                    <TableRow>
                        {
                            columns.map((e, i) => {
                                return <TableCell key={i}>{e}</TableCell>
                            })
                        }
                    </TableRow>
                </TableHead>
                <TableBody>
                    {data.map((row, i) => (
                        <TableRow
                            key={i}
                            sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                        >
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                {row['username']}
                            </TableCell>
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                {row['mobile']}
                            </TableCell>
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                {row['email']}
                            </TableCell>
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                {row['userstatus']['name']}
                            </TableCell>
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                {row['role']['name']}
                            </TableCell>
                            <TableCell component="th" scope="row" sx={{ width: '10px' }}>
                                <div style={{display: 'flex', gap: '5px'}}>
                                <Button variant="contained" color='primary' sx={{backgroundColor:'#dd0000'}} onClick={() => {
                                    handleDelete(row['id']);
                                }}>Delete</Button>
                                <Button variant="contained" color='primary' onClick={() =>{
                                    handleClickOpen();
                                    setSelectedUser(row);
                                }}>Edit</Button>
                                </div>
                            </TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </TableContainer>
        <Dialog
          open={open}
          onClose={handleClose}
        >
          <UserEditForm oldUser={selectedUser} onCreateFormClose={handleCreateFormClose}/>
            
      </Dialog>
        </div>
    )
}

export default TableComponent