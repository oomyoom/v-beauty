// สร้างฟังก์ชันสำหรับการสร้าง order_id
const databaseUtils = require("../utils/databaseUtils");

async function getOrder(uid) {
  const allOrder = [];

  try {
    const orderQuery = `SELECT * FROM orders WHERE UserID = ${uid} ORDER BY orders.CreatedAt DESC`;
    const orderResults = await databaseUtils.getDataFromdb(orderQuery);

    if (orderResults.length > 0) {
      for (let i = 0; i < orderResults.length; i++) {
        const cartQuery = `SELECT * FROM order_lines WHERE OrderID = '${orderResults[i].OrderID}'`;
        const cartResults = await databaseUtils.getDataFromdb(cartQuery);

        if (cartResults.length > 0) {
          for (let j = 0; j < cartResults.length; j++) {
            const productQuery = `SELECT * FROM products WHERE ProductID = ${cartResults[j].ProductID}`;
            const [productResults] = await databaseUtils.getDataFromdb(
              productQuery
            );

            cartResults[j].Product = productResults;
          }
        }

        orderResults[i].Cart = cartResults;
        allOrder.push(orderResults[i]);
      }
    }
    return allOrder;
  } catch (error) {
    throw error;
  }
}

function generateOrderId(uid) {
  const prefix = "ORD-";
  const uniqueSegment = Date.now().toString().slice(-4); // ใช้ 4 ตัวเลขสุดท้ายจาก timestamp
  const randomSegment = Math.random()
    .toString(36)
    .substring(2, 6)
    .toUpperCase(); // สร้างสตริงแบบสุ่ม
  return `${prefix}${uid}${uniqueSegment}${randomSegment}`;
}

module.exports = { generateOrderId, getOrder };
