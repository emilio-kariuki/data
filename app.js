const mongoDbConnection = require('../database/database');
const express = require('express');
const router = require('./routes/routes');
const app = express();

app.use(express.urlencoded({ extended: false}));
app.use(express.json());
mongoDbConnection();
app.use('/', router);
app.listen(8080, () => console.log("Server rocking at port 8080"));
