const Koa = require('koa');
const app = new Koa();
const cors = require('koa2-cors');
const Router = require('koa-router');
const router = new Router();
const mysql = require('mysql2/promise');
const bodyParser = require('koa-bodyparser');
app.use(bodyParser());
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
    origin: function (ctx) {
      return '*'
    },
    maxAge: 5, //指定本次预检请求的有效期，单位为秒。
    credentials: true, //是否允许发送Cookie
    allowMethods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], //设置所允许的HTTP请求方法
    allowHeaders: ['Content-Type', 'Authorization', 'Accept'], //设置服务器支持的所有头信息字段
    exposeHeaders: ['WWW-Authenticate', 'Server-Authorization'] //设置获取其他自定义字段
  })
)
router.get('/major', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select * from Zhengh_major18')
})
router.get('/statistic', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select * from zhengh_course_statistic18')
})
router.get('/ScoreStatisticPerYear', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select 姓名,学号,课程编号 课程号,课程名,成绩 ,学期 from zhengh_scoresview18')
})
router.get('/teachercourse', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select zh_Tno18 tno,zh_Cno18 id,zh_Cname18 name,zh_Tname18 teacher,zh_Hours18 hours,zh_Credit18 credit,zh_Classname18 classname from zhengh_teachercourse18')
})
router.get('/place', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select * from zhengh_studentsource18;')
  console.log(ctx.body)
})
router.get('/courseAvgScore', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select * from Zhengh_courseavgscore18')
})
router.get('/scorerank', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select zh_Sno18 id,zh_Sname18 name,zh_Classname18 classname,s.`sum(c.zh_Score)/sum(s.zh_Credit18)` gpa from zhengh_averagegpa18 s ORDER BY `sum(c.zh_Score)/sum(s.zh_Credit18)` DESC')
})
router.get('/classcourse', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('SELECT t.* FROM main.zhengh_classcourse18 t')

})
router.get('/studentcourse', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('select  zh_Sno18 sid,zh_Cno18 id,zh_Cname18 name,zh_Term18 semester,zh_Score score,zh_credit18 from zhengh_coursegpa18')
})
router.post('/update', async (ctx) => {
  let data = ctx.request.body;
  for (let i = 0; i < data.length;i++) {
    await pool.execute(`update zhengh_studentscore18 set zh_Score = ${data[i].zh_Score} where zh_Sno18 ='${data[i].zh_Sno18}' and zh_Cno18='${data[i].zh_Cno18}'`);
    await pool.execute(`call Zhengh_updateCredit18('${data[i].zh_Sno18}')`)
  }
  
})
router.get('/score', async (ctx) => {
  ctx.response.type = 'text/plain';
  [ctx.body, fields] = await pool.query('SELECT t.* FROM main.zhengh_ratescore18 t')
})
app.use(router.routes()).use(router.allowedMethods())
app.listen(3000);
console.log('Server listening on 127.0.0.1:3000')
app.on('error', err => {
  console.log('server error', err)
});