const express = require('express');
const app = express();
app.use(express.json());
app.get('/',(res,req)=> res.status(200).json({name: "Emilio"}));
app.listen(3000,()=> console.log("Server running"));