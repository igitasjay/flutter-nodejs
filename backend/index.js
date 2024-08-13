const express = require("express");
const mongoose = require("mongoose");
const secret = require("./secret.js");
const productRoute = require("./routes/route.product.js");
const app = express();

// Middleware

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use("/api/products", productRoute);

//

app.get("/api/products", async (req, res) => {
  res.send("Hi from server");
});

// Variables

const username = secret.mongoUsername;
const password = secret.mongoPassword;

// Connect to database (MongoDB)

mongoose
  .connect(
    `mongodb+srv://${username}:${password}@crud-cluster.inlee.mongodb.net/?retryWrites=true&w=majority&appName=CRUD-Cluster`
  )
  .then(() => {
    console.log("Connected to MongoDB");
    app.listen(2000, () => {
      console.log("Server is running on port 2000");
    });
  })
  .catch((error) => {
    console.log(error);
  });
