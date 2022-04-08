const express = require('express');
const router = express.Router();
const app 
const User = require('../models/index.model');

app.post('/register', (req, res)=>{
    console.log("Inside the register");
    const user = new User({
      username: req.body.name,
      password: req.body.password,
      email:req.body.email
    });
    user.save().then(() => {
     console.log("User has been saved");
     res.status(200).json("ok").catch(err => {
       res.status(403).json(err);
       
     })
    })
  })