const Koa = require('koa');
const app = new Koa();
const cors = require('koa2-cors');
const Router=require('koa-router');
const router=new Router();
var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '147258',
  database : 'main'
});
connection.connect();
// response
app.use(
  cors({
      origin: function(ctx) { //设置允许来自指定域名请求
          if (ctx.url === '/test') {
              return '*'; // 允许来自所有域名请求
          }
          return 'http://localhost:8080'; //只允许http://localhost:8080这个域名的请求
      },
      maxAge: 5, //指定本次预检请求的有效期，单位为秒。
      credentials: true, //是否允许发送Cookie
      allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], //设置所允许的HTTP请求方法
      allowHeaders: ['Content-Type', 'Authorization', 'Accept'], //设置服务器支持的所有头信息字段
      exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'] //设置获取其他自定义字段
  })
)
router.get('/list', async (ctx) => {
  ctx.response.type = 'text/plain';
  ctx.response.body = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
})

router.get('/test', async (ctx) => {
  ctx.body = {'test-ok':'2'};
})
app.use(router.routes()).use(router.allowedMethods())
app.listen(3000);
console.log('Server listening on 127.0.0.1:3000')
app.on('error', err => {
  log.error('server error', err)
});