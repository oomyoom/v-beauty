const jwt = require("jsonwebtoken");

function verifyToken(req, res, next) {
  const token = req.headers.authorization.split(" ")[1];

  if (!token) {
    return res.status(403).json({ error: "ไม่มี Token ในการเข้าถึง" });
  }

  jwt.verify(token, "shhhhh", (err, decoded) => {
    if (err) {
      return res.status(401).json({ error: "Token ไม่ถูกต้อง" });
    }
    req.uid = decoded.id;
    next();
  });
}

module.exports = {
  verifyToken,
};
