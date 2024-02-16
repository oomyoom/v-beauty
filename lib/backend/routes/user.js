const express = require("express");
const router = express.Router();
const userProfileRetrieval = require("../controllers/userProfileRetrieval");
const multer = require("multer");
let dbCon = require("../lib/dbCon");
const { verifyToken } = require("../middlewares/authToken"); // นำเข้า middleware

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.get("/get", verifyToken, async (req, res) => {
  try {
    const user = await userProfileRetrieval.retrieveUserProfile(req.uid); //req.uid
    res.status(200).json(user);
  } catch (error) {
    console.error("เกิดข้อผิดพลาดในการดึงข้อมูล:", error);
    res.status(500).json({ error: "เกิดข้อผิดพลาดในการดึงข้อมูล" });
  }
});

router.patch("/update/personal", verifyToken, async (req, res) => {
  try {
    const { fname, lname, gender, birthday } = req.body; // Get other data

    await dbCon
      .promise()
      .query(
        `UPDATE users SET fname = ?, lname = ?, gender = ?, birthday = ? WHERE uid = ${req.uid}`,
        [fname, lname, gender, birthday]
      );

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch("/update/contact", verifyToken, async (req, res) => {
  try {
    const { email, tel } = req.body; // Get other data

    await dbCon
      .promise()
      .query(`UPDATE users SET email = ?, tel = ? WHERE uid = ${req.uid}`, [
        email,
        tel,
      ]);

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch("/update/delivery", verifyToken, async (req, res) => {
  try {
    const { provider, address, zipcode } = req.body; // Get other data

    await dbCon
      .promise()
      .query(
        `UPDATE users SET provider = ?, address = ?, zipcode = ? WHERE uid = ${req.uid}`,
        [provider, address, zipcode]
      );

    res.status(200).send("Data and image uploaded successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send("Error uploading data and image");
  }
});

router.patch(
  "/update/image",
  verifyToken,
  upload.single("image"),
  async (req, res) => {
    try {
      const image = req.file.buffer; // Get the image buffer

      await dbCon
        .promise()
        .query(`UPDATE users SET image = ? WHERE uid = ${req.uid}`, [image]);

      res.status(200).send("Data and image uploaded successfully");
    } catch (error) {
      console.error(error);
      res.status(500).send("Error uploading data and image");
    }
  }
);

module.exports = router;
