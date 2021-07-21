const Koa = require('koa');
const app = new Koa();
const cors = require('koa2-cors');
const Router = require('koa-router');
const router = new Router();
const mysql = require('mysql2/promise');
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '147258',
  database: 'main',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});
// response
app.use(
  cors({
    origin: function (ctx) { //设置允许来自指定域名请求
      return '*'; //只允许http://localhost:8080这个域名的请求
    },
    maxAge: 5, //指定本次预检请求的有效期，单位为秒。
    credentials: true, //是否允许发送Cookie
    allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], //设置所允许的HTTP请求方法
    allowHeaders: ['Content-Type', 'Authorization', 'Accept'], //设置服务器支持的所有头信息字段
    exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'] //设置获取其他自定义字段
  })
)
router.get('/major', async (ctx)=>{
  ctx.response.type = 'text/plain';
  [ctx.body,fields] = await pool.query('select * from Zhengh_major18')
})
router.get('/statistic', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body,fields] = await pool.query('select * from zhengh_course_statistic18')
})
router.get('/Courselist', async (ctx) => {
  ctx.response.type = 'text/plain';
  pool.query()
})
router.get('/place', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body,fields] = await pool.query('select * from zhengh_studentsource18;')
  console.log(ctx.body)
})
router.get('/courseAvgScore', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body,fields] = await pool.query('select * from Zhengh_courseavgscore18')
})
app.use(router.routes()).use(router.allowedMethods())
app.listen(3000);
console.log('Server listening on 127.0.0.1:3000')
app.on('error', err => {
  console.log('server error', err)
});