const sql = require('mssql');
const { queries, getConnection } = require('../database');

const getUsers = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query(queries.getAllUsers);
    res.status(200).send(result.recordset);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

const postUsers = async (req, res) => {
  const { usuario, contrasena, email, id_rol } = req.body;

  if (
    usuario == null ||
    contrasena == null ||
    email == null ||
    id_rol == null
  ) {
    return res.status(403).json({ msg: 'Bad Request. Please fill all fields' });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input('usuario', sql.VarChar, usuario)
      .input('contraseña', sql.VarChar, contrasena)
      .input('email', sql.VarChar, email)
      .input('id_rol', sql.Int, id_rol)
      .query(queries.insertUser);
    res.status(200).send(result);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

const getUserById = async (req, res) => {
  const { id } = req.params;

  const pool = await getConnection();
  const result = await pool
    .request()
    .input('Id', id)
    .query(queries.getUserById);

  if (result.recordset.length === 0) {
    return res.status(403).send('Forbbiden. The user is not in the colection.');
  }
  res.status(200).send(result.recordset[0]);
};

const deleteUserById = async (req, res) => {
  const { id } = req.params;
  const isDeleted = 1;

  const pool = await getConnection();
  const result = await pool
    .request()
    .input('isDeleted', sql.Bit, isDeleted)
    .input('Id', id)
    .query(queries.deleteUserById);

  if (result.rowsAffected[0] === 0) {
    return res.status(403).send('Forbidden. The user is not in the colection.');
  }

  res.status(200).send('Deleted user');
};

const updateUserById = async (req, res) => {
  const { id } = req.params;
  const { usuario, contraseña, email, id_rol } = req.body;

  if (
    usuario == null ||
    contraseña == null ||
    email == null ||
    id_rol == null
  ) {
    return res.status(403).json({ msg: 'Bad Request. Please fill all fields' });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input('usuario', sql.VarChar, usuario)
      .input('contraseña', sql.VarChar, contraseña)
      .input('email', sql.VarChar, email)
      .input('id_rol', sql.Int, id_rol)
      .input('id', sql.Int, id)
      .query(queries.insertUser);
    res.status(200).send(result);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

module.exports = {
  getUsers,
  postUsers,
  getUserById,
  deleteUserById,
  updateUserById,
};
