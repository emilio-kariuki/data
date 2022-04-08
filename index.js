const mongoose = require("mongoose");
const express = require("express");
const app = express();
app.use(express.json());

const port = process.env.port || 5000;
mongoose.connect("mongodb://localhost:27017/AppDb",{useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: true});

const connection = mongoose.connection;
connection.once("open",()=>{
  console.log("MogoDb database has been connected");
});

app.get('/', (req, res) => {
  res.send("Response has been sent");
});

const useRoute = require("./routes/user");
app.use('/user', useRoute);

app.listen(port,() => console.log("Server connect at " + port));