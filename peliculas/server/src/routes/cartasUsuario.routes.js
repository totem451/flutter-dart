const express = require('express');
const routerCartasUsuarios = express.Router();
const { getCardsByUser } = require('../controllers/cartasUsuario.controller');

routerCartasUsuarios.get('/users/:idUser/cards', getCardsByUser);

module.exports = routerCartasUsuarios;
