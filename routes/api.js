const express = require("express");
const router = express.Router();
const Employee = require("../models/employee");

router.get("/employee", function (req, res, next) {
  Employee.find({})
    .then((employees) => res.send(employees))
    .catch(next);
});

router.post("/employee", function (req, res, next) {
  Employee.create(req.body)
    .then((employee) => res.send(employee))
    .catch(next);
});

module.exports = router;
