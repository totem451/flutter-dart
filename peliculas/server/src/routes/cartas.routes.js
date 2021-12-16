const express = require('express');
const routerCartas = express.Router();
const {
  getCards,
  postCards,
  getCardById,
  deleteCardById,
  updateCardById,
} = require('../controllers/cartas.controller');

routerCartas.get('/cards', getCards);

routerCartas.post('/cards', postCards);

routerCartas.get('/cards/:id', getCardById);

routerCartas.delete('/cards/:id', deleteCardById);

routerCartas.put('/cards/:id', updateCardById);

module.exports = routerCartas;
