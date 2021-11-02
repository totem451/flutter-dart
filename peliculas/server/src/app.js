const { urlencoded } = require('express');
const express = require('express');
const dev = require('./config');
const app = express();
const routerCartas = require('./routes/cartas.routes');
const routerCartasUsuarios = require('./routes/cartasUsuario.routes');
const routerUsuarios = require('./routes/usuarios.routes');
const cors = require('cors');

let port;

//settings
app.set('port', dev.port);

//middlewares
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: false }));

app.use(routerCartas, routerUsuarios, routerCartasUsuarios);

module.exports = app;
