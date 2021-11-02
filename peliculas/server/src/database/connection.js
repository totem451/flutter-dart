const sql = require('mssql');
const dev = require('../config');

const dbSetting = {
  user: dev.dbUser,
  password: dev.dbPassword,
  server: dev.dbServer,
  database: dev.database,
  options: {
    encrypt: true, // for azure
    trustServerCertificate: true, // change to true for local dev / self-signed certs
  },
};

//connect db and query
const getConnection = async () => {
  try {
    const pool = await sql.connect(dbSetting);
    return pool;
  } catch (error) {
    console.log(error);
  }
};

module.exports = getConnection;
