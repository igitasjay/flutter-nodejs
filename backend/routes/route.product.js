const express = require("express");
const router = express.Router();
const {
  createProduct,
  fetchProducts,
} = require("../controllers/controller.product.js");

router.post("/", createProduct);

router.get("/", fetchProducts);

module.exports = router;
