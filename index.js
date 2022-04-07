const express = require('express');
const app = express();
app.use(express.json());
app.get('/',(res,req)=> res.json({name: "Emilio"}));
app.listen(3000,()=> console.log("Server running"));