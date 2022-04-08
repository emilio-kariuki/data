const mongoose = require("mongoose");
const express = require("express");
const app = express();
app.use(express.json());

const port = process.env.port || 5000;
mongoose.connect("mongodb+srv://emilio:0722937438@cluster0.xdlrq.mongodb.net/myFirstDatabase?retryWrites=true",{useNewUrlParser: true, useUnifiedTopology: true});

const connection = mongoose.connection;
connection.once("open",()=>{
  console.log("MogoDb database has been connected");
});

app.get('/', (req, res) => {
  res.send("Welcome to this webpage");
});

const useRoute = require("./routes/user");
app.use('/user', useRoute);

app.listen(port,() => console.log("Server connect at " + port));