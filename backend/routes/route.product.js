const express = require("express");
const router = express.Router();
const { createProduct } = require("../controllers/controller.product.js");

router.post("/", createProduct);

module.exports = router;
