require('dotenv').config();
const dev = {
  port: process.env.PORT || 4000,
  dbUser: process.env.DB_USER || '',
  dbPassword: process.env.DB_PASSWORD || '',
  dbServer: process.env.DB_SERVER || '',
  database: process.env.DATABASE || '',
};

module.exports = dev;
