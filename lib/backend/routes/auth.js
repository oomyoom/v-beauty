var express = require("express");
var router = express.Router();
let dbCon = require("../lib/db");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

router.post("/login", (req, res) => {
  const { Email, Password } = req.body;

  if (!Email || !Password) {
    return res
      .status(400)
      .json({ message: "กรุณากรอกชื่อผู้ใช้และรหัสผ่าน", status: 400 });
  }

  const query1 =
    "SELECT UserID, Email, Password, UserName FROM app_users WHERE Email = ?";

  dbCon.query(query1, [Email], async (err, results) => {
    if (err) {
      console.error("เกิดข้อผิดพลาดในการค้นหาข้อมูลผู้ใช้: " + err.message);
      return res.status(500).json({ message: "มีข้อผิดพลาดในการล็อกอิน" });
    }

    if (results.length === 0) {
      return res.status(401).json({ error: "Wrong User" });
    }

    const userData = results[0];

    try {
      const isPasswordCorrect = await bcrypt.compare(
        Password,
        userData.Password
      );
      if (!isPasswordCorrect) {
        return res.status(401).json({ error: "Login Fail" });
      }

      const query2 = "SELECT UserGroupID FROM app_user_roles WHERE UserID = ?";

      dbCon.query(query2, [userData.UserID], (err, roleResults) => {
        if (err) {
          console.error("เกิดข้อผิดพลาดในการค้นหา UserGroupID: " + err.message);
          return res.status(500).json({ error: "Login Fail" });
        }

        const roleData = roleResults[0];

        const payload = {
          email: userData.Email,
          id: userData.UserID,
          name: userData.UserName,
          status: userData.Status,
          role_id: roleData ? roleData.UserGroupID : null, // ตรวจสอบว่ามี roleData หรือไม่
        };

        const token = jwt.sign(payload, "shhhhh", { expiresIn: "1h" });
        res.status(200).json({ token: token, status: "success" });
      });
    } catch (bcryptErr) {
      console.error(
        "เกิดข้อผิดพลาดในการเปรียบเทียบรหัสผ่าน: " + bcryptErr.message
      );
      return res.status(500).json({ error: "Login Fail" });
    }
  });
});

module.exports = router;
