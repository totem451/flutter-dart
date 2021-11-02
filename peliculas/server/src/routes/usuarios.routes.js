const express = require('express');
const {
  getUsers,
  postUsers,
  getUserById,
  deleteUserById,
  updateUserById,
} = require('../controllers/usuarios.controllers');
const routerUsuarios = express.Router();

routerUsuarios.get('/users', getUsers);

routerUsuarios.post('/users', postUsers);

routerUsuarios.get('/users/:id', getUserById);

routerUsuarios.delete('/users/:id', deleteUserById);

routerUsuarios.put('/users/:id', updateUserById);

module.exports = routerUsuarios;
