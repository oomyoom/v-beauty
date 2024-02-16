const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'v-maker'
  });
  
  db.connect((err) => {
    if (err) {
      console.log('Database connection failed: ' + err.message);
    } else {
      console.log('Database connected');
    }
  });

  module.exports = db;