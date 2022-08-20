// Import the needed packages from npm
const express = require('express');
const mysql = require('mysql');

const server = express();
const PORT = process.env.PORT || 3041;

const dbConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: null,
    database: 'spotify_db'
});

// Define a simple route that will be used to run queries on the connected database
server.get('/api/songs/:title', (req, res) => {
    dbConnection.query(`SELECT * FROM songs WHERE title LIKE '%${req.params.title}%'`, (error, rows, fields) => {
        if(error) {
            res.status(500);
        } else {
            res.status(200).json(rows);
        }
    });
})

// Try to connect to the database. Only if it works, keep listening for incoming requests
dbConnection.connect(error => {
    if(error) {
        console.log(`Couldn't start server: ${error}`);
    } else {
        server.listen(PORT, () => {console.log(`Port is open at ${PORT}`)});
    }
});
