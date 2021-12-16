const sql = require('mssql');
const { queries, getConnection } = require('../database');

const getCardsByUser = async (req, res) => {
  const { idUser } = req.params;

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input('idUser', sql.Int, idUser)
      .query(queries.getCardsByUser);
    res.status(200).send(result.recordset);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

module.exports = { getCardsByUser };
