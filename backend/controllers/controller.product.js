const Product = require("../models/model.product.js");

const createProduct = async (req, res) => {
  try {
    const product = await Product.create(req.body);
    res.status(200).send({
      message: "Product created successfully",
      statusCode: 200,
      product: product,
    });
    // res.status(200).json(product);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const fetchProducts = async (req, res) => {
  try {
    const products = await Product.find({});
    res.status(200).send({
      message: "Fetched in peace",
      statusCode: 200,
      products: products,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  createProduct,
  fetchProducts,
};
