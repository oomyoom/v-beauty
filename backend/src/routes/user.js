const express = require("express");
const router = express.Router();
const userProfileRetrieval = require("../controllers/userProfileRetrieval");
const multer = require("multer");
const { db } = require("../config/database");
const { verifyToken } = require("../middlewares/authToken"); // นำเข้า middleware

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.get("/get", async (req, res) => {
  try {
    const user = await userProfileRetrieval.retrieveUserProfile(1); //req.uid
    res.status(200).json(user);
  } catch (error) {
    console.error("เกิดข้อผิดพลาดในการดึงข้อมูล:", error);
    res.status(500).json({ error: "เกิดข้อผิดพลาดในการดึงข้อมูล" });
  }
});

router.patch("/update/personal", async (req, res) => {
  try {
    const { fname, lname, gender, birthday } = req.body; // Get other data

    await db
      .promise()
      .query(
        `UPDATE users SET fname = ?, lname = ?, gender = ?, birthday = ? WHERE uid = 1`,
        [fname, lname, gender, birthday]
      );

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch("/update/contact", async (req, res) => {
  try {
    const { email, tel } = req.body; // Get other data

    await db
      .promise()
      .query(`UPDATE users SET email = ?, tel = ? WHERE uid = 1`, [email, tel]);

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch("/update/delivery", async (req, res) => {
  try {
    const { provider, address, zipcode } = req.body; // Get other data

    await db
      .promise()
      .query(
        `UPDATE users SET provider = ?, address = ?, zipcode = ? WHERE uid = 1`,
        [provider, address, zipcode]
      );

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch("/update/image", upload.single("image"), async (req, res) => {
  try {
    const image = req.file.buffer; // Get the image buffer

    await db
      .promise()
      .query(`UPDATE users SET image = ? WHERE uid = 1`, [image]);

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

module.exports = router;
