let dbCon = require("../lib/dbConCon");

async function getDataFromdbCon(query) {
  return new Promise((resolve, reject) => {
    dbCon.query(query, (error, results) => {
      if (error) {
        reject(error);
        return;
      }
      resolve(results);
    });
  });
}

function getLastId(tableName, callback) {
  const query = `SHOW TABLE STATUS LIKE \'${tableName}\'`;

  dbCon.query(query, (error, results) => {
    if (error) {
      console.error(`เกิดข้อผิดพลาดในการดึงค่าล่าสุด: `, error);
      callback(error, null);
      return;
    }

    if (results.length > 0) {
      const nextAutoIncrement = results[0].Auto_increment;
      callback(null, nextAutoIncrement);
    } else {
      callback("Table not found", null);
    }
  });
}

function updateColumn(query, newValue, callback) {
  dbCon.query(query, newValue, (error, results) => {
    if (error) {
      console.error("เกิดข้อผิดพลาดในการอัปเดตข้อมูล: " + error.message);
      callback(error);
      return;
    } else {
      callback(null, results);
    }
  });
}

module.exports = {
  getDataFromdbCon,
  getLastId,
  updateColumn,
};
