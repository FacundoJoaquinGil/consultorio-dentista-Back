const mysql = require("mysql")

//     ---- Creamos la conexion a la db con los respectivos datos ----     //

exports.db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "hola123",
    database: "dentista"
})