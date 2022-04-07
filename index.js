const express = require('express');
const app =  express();

app.listen(process.env.port || 8080, () => console.log("Server Started"));
