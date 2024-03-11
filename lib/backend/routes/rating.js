const express = require("express");
const router = express.Router();
let dbCon = require("../lib/db");

router.post("/create", async (req, res) => {
  let { uid, productId, rating, comment } = req.body;
  let sql =
    "INSERT INTO reviews (UserID, ProductID, Rating, Comment) VALUES (?, ?, ?, ?)";
  dbCon.query(sql, [uid, productId, rating, comment], (err, result) => {
    if (err) throw err;
    res.send("Rating added successfully");
  });
});

module.exports = router;

