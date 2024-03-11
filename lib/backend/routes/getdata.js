var express = require("express");
var router = express.Router();
let dbCon = require("../lib/db");

router.get("/products", function (req, res) {
  let sql = `
        SELECT products.*, categories.*, AVG(reviews.Rating) as AverageRating
        FROM products
        JOIN categories ON products.CategoryID = categories.CategoryID
        LEFT JOIN reviews ON products.ProductID = reviews.ProductID
        GROUP BY products.ProductID`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

router.get("/products/facemakeup", function (req, res) {
  let sql = `SELECT products.*, categories.*
    FROM products
    JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE products.CategoryID = 1;`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

router.get("/products/eyemakeup", function (req, res) {
  let sql = `SELECT products.*, categories.*
    FROM products
    JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE products.CategoryID = 2;`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

router.get("/products/lipmakeup", function (req, res) {
  let sql = `SELECT products.*, categories.*
    FROM products
    JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE products.CategoryID = 3;`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

router.get("/products/skincare", function (req, res) {
  let sql = `SELECT products.*, categories.*
    FROM products
    JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE products.CategoryID = 4;`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

router.get("/products/menmakeup", function (req, res) {
  let sql = `SELECT products.*, categories.*
    FROM products
    JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE products.CategoryID = 5;`;
  // let sql = "SELECT * FROM products";
  dbCon.query(sql, function (err, result) {
    if (err) {
      console.log("เกิดข้อผิดพลาดในการดึงข้อมูล: " + err);
      res.status(500).send("Internal Server Error");
    } else {
      res.status(200).json(result);
    }
  });
});

module.exports = router;
