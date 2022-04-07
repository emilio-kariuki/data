const express = require('express');
const router = express.Router();
const Employee = require('../models/employee');

router.get('/employee',(req,res)=>Employee.find().then(employees=>res.json(employees)));

router.post('/employee',(req,res)=>
    res.send({
        type: "Post",
        name: req.body.name,
    })
);

module.exports = router;