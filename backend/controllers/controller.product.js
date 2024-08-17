const Product = require("../models/model.product.js");

const createProduct = async (req, res) => {
  try {
    const product = await Product.create(req.body);
    res.status(200).send({
      message: "Product created successfully",
      statusCode: 200,
      data: product,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const fetchProducts = async (req, res) => {
  try {
    const products = await Product.find();
    res.status(200).send({ products });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const fetchSingleProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Product.findById(id);

    if (!product) {
      return res.status(404).send({
        statusCode: 404,
        message: "Product not found",
      });
    }

    res.status(200).send({
      statusCode: 200,
      data: product,
    });
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};

const updateProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Product.findByIdAndUpdate(id, req.body, {
      new: true,
    });

    if (!product) {
      return res.status(404).send({
        statusCode: 404,
        message: "Product not found",
      });
    }

    res.status(200).send({
      status: "success",
      message: "Product updated successfully",
      data: product,
    });
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};

const deleteProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const product = await Product.findByIdAndDelete(id);
    if (!product) {
      return res.status(404).send({
        statusCode: 404,
        message: "Product not found",
      });
    }
    res.status(200).send({
      status: "success",
      message: "Product deleted successfully",
    });
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};

module.exports = {
  createProduct,
  fetchProducts,
  fetchSingleProduct,
  updateProduct,
  deleteProduct,
};
