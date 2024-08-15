const express = require("express");
const router = express.Router();
const {
  createProduct,
  fetchProducts,
  fetchSingleProduct,
  updateProduct,
  deleteProduct,
} = require("../controllers/controller.product.js");

router.post("/", createProduct);

router.get("/", fetchProducts);

router.get("/:id", fetchSingleProduct);

router.put("/:id", updateProduct);

router.delete("/:id", deleteProduct);

module.exports = router;
