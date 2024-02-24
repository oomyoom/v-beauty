// สร้างฟังก์ชันสำหรับการสร้าง order_id
function generateOrderId(uid) {
  const prefix = "ORD-";
  const uniqueSegment = Date.now().toString().slice(-4); // ใช้ 4 ตัวเลขสุดท้ายจาก timestamp
  const randomSegment = Math.random()
    .toString(36)
    .substring(2, 6)
    .toUpperCase(); // สร้างสตริงแบบสุ่ม
  return `${prefix}${uid}${uniqueSegment}${randomSegment}`;
}

module.exports = { generateOrderId };
