const Koa = require('koa');
const app = new Koa();
var mysql      = require('mysql');

// response
app.use(ctx => {
  
  ctx.body = 'Hello Koa';
});

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '147258',
  database : 'main'
});
 
connection.connect();
 
connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0].solution);
});
app.listen(3000);