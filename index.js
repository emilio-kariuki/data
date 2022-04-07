const express = require('express');
const app = express();

app.get('/api',(req,res) => res.send("Api working fine"));


app.listen(process.env.port || 8080, function(){
    console.log("Server started");
}

);