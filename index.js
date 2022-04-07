const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://localhost/data');
mongoose.Promise = global.Promise;
app.use(express.json());
app.use('/api', require('./routes/api'));
// app.get('/api',(req,res) => res.send("Api working fine"));
// app.use(function(req,res,next,err){
//     res.status(422).send({error: err.message});
// });


app.listen(process.env.port || 8080, function(){
    console.log("Server started");
}

);