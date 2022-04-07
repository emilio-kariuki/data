const express = require('express');
const app = express();
app.get('',(res,req)=> res.json({name: "Emilio"}));
app.listen(3000,()=> console.log("Server running"));