var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '147258',
    database: 'main'
});
var st=''
connection.connect();

const q = () => {
    connection.query('select * from zhengh_studentsource18;', (error, results, fields) => {
        if (error) {
            console.log(error);
        }
        else {
            st=results[0].生源地;
            return st
        }
    })
}

console.log(q() + '1');
console.log(st)
