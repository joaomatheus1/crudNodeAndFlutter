import 'dotenv/config';
import mysql from 'mysql2';

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
})

connection.connect((err) => {
    if(err) {
        console.log("Erro ao conectar com banco", err.code)
        return;
    }
    else {
        console.log("Conectado ao banco de dados.")
    }
})

connection.end;

export default connection;