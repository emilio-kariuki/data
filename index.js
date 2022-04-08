const mongoose = require("mongoose");
const express = require("express");
const app = express();
app.use(express.json());

const port = process.env.port || 5000;
mongoose.connect("mongodb+srv://emilio:0722937438@cluster0.xdlrq.mongodb.net/myFirstDatabase?retryWrites=true",{useNewUrlParser: true});

const connection = mongoose.connection;
connection.once("open",()=>{
  console.log("MogoDb database has been connected");
});

app.get('/', (req, res) => {
  res.send("Response has been sent");
});

app.post('/register', (req, res)=>{
  console.log("Inside the register");
  const user = new User({
    username: req.body.name,
    password: req.body.password,
    email:req.body.email
  });
  user.save().then(() => {
   con("User has been saved");
  })
})

app.listen(port,() => console.log("Server connect at " + port));