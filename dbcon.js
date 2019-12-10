var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_mariast',
  password        : '7042',
  database        : 'cs340_mariast'
});
module.exports.pool = pool;

