const mongoose = require("mongoose");
const express = require("express");
const app = express();
app.use(express.json());

const port = process.env.port || 5000;

app.get('/', (req, res) => {
  res.send("Response has been sent");
})

app.listen(port,() => console.log("Server connect at " + port));