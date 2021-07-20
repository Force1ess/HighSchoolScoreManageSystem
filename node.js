const Koa = require('koa');
const app = new Koa();
var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '147258',
  database : 'main'
});
connection.connect();
// response
app.use(ctx => {
  console.log(ctx.query)
  connection.query('select * from Zhengh_Student18', function (error, results, fields) {
    if (error) throw error;
    else console.log(results)
  });
});
app.listen(3000);
app.on('error', err => {
  log.error('server error', err)
});