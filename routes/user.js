
const express = require("express");
const app = express();
const router = express.Router();
const User = require("../models/index.model");


router.route("/register").post((req, res) => {
  console.log("Inside the register");
  const user = new User({
    name: req.body.name,
    password: req.body.password,
    email: req.body.email,
  });
  user.save().then(() => {
    console.log("User has been saved");
    res
      .status(200)
      .json("ok");
  }).catch((err) => {
    res.status(403).json({msg: err});
  });
});

module.exports = router;
