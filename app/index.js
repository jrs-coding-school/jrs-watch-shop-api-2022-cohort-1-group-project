// connect to mongoDB
const dbConfig = require('./config/db.config');
const mysql = require('mysql');

const connection = mysql.createConnection(dbConfig);

connection.connect(
    (err) => {
        if (err) {
            throw err;
        } else {
            console.log("Connected to SQL Database: ", dbConfig.database)
        }
    }
);

module.exports = connection;
