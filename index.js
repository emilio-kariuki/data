const express = require('express');
const app =  express();
app.get('',(req, res)=>
    res.send("Emilio started the server")
);
app.listen(process.env.port || 8080, () => console.log("Server Started"));
