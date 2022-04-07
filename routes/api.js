const express = require('express');
const router = express.Router();
const Employee = require('../models/employee');

router.get('/employee',(req,res)=>Employee.find().then(employees=>res.send(employees)).catch(next));

router.post('/employee',(req,res)=>
    Employee.create(req.body).then(employees=>res.send(employees)).catch(next)
);

module.exports = router;