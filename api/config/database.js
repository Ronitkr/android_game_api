// let db = {
//     host    : 'localhost',
//     user    : 'root',
//     password: '',
//     database: 'android_app'
//   };
   
// module.exports = db;

var mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'android_app'
});

connection.connect(function(err) {
  if (err) throw err;
  console.log('Database connected!');
});

module.exports = connection;