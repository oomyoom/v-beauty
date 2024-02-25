const express = require("express");
const router = express.Router();
let dbCon = require("../lib/db");
const orderController = require("../controllers/orderController");
const { verifyToken } = require("../middlewares/authToken"); // นำเข้า middleware

router.post("/create", (req, res) => {
  let { uid, payment, total, items } = req.body;
  let orderId = orderController.generateOrderId(uid); // สร้าง order_id ด้วยฟังก์ชันที่กำหนด

  // บันทึกข้อมูลการชำระเงินลงในตาราง payment
  let paymentsql =
    "INSERT INTO payment (Status, PaymentMethodID) VALUES (?, ?)";
  dbCon.query(paymentsql, ["จ่ายแล้ว", payment], (err, paymentResult) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Server error");
    }
    // ใช้ paymentID จากการเพิ่มข้อมูลการชำระเงิน
    let paymentId = paymentResult.insertId; // ดึง paymentID จากผลลัพธ์

    let sql =
      "INSERT INTO orders (OrderID, UserID, PaymentID, Total) VALUES (?, ?, ?, ?)";
    dbCon.query(sql, [orderId, uid, paymentId, total], (err, orderResult) => {
      if (err) {
        console.error(err);
        return res.status(500).send("Server error");
      }

      // วนลูปเพื่อบันทึกข้อมูลสินค้าแต่ละรายการลงในตาราง order_lines
      items.forEach((item) => {
        const productId = item.productItem.ProductID;
        const quantity = item.quantity;

        const orderLineSql =
          "INSERT INTO order_lines (OrderID, ProductID, Quantity) VALUES (?, ?, ?)";
        dbCon.query(
          orderLineSql,
          [orderId, productId, quantity],
          (err, lineResult) => {
            if (err) {
              console.error(err);
              // การจัดการข้อผิดพลาด
            }
          }
        );
      });

      res.json({ success: true, orderId: orderId }); // ส่งคืน response ว่าสำเร็จ
    });
  });
});

router.get("/get", verifyToken, async (req, res) => {
  try {
    const orders = await orderController.getOrder(req.uid);
    res.status(200).json(orders);
  } catch (error) {
    console.error(error);
    res.status(500).send("Server error");
  }
});

module.exports = router;
