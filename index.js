const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://localhost/data');
mongoose.Promise = global.Promise;
app.use(express.json());
// app.get('/api',(req,res) => res.send("Api working fine"));


app.listen(process.env.port || 8080, function(){
    console.log("Server started");
}

);