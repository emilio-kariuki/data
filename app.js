const mongoDbConnection = require('../database/database');
const express = require('express');
const app = express();

app.use(express.urlencoded({ extended: false}));
app.use(express.json());
mongoDbConnection();
