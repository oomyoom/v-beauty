const databaseUtils = require("../utils/databaseUtils");

async function retrieveUserProfile(uid) {
  const user = [];

  try {
    const userQuery = `SELECT Image, FirstName, LastName, Gender, Birthday, Email, Tel, Provider, Address, Zipcode FROM app_user_details WHERE UserID = ${uid}`;
    const userResult = await databaseUtils.getDataFromdb(userQuery);

    if (userResult.length > 0) {
      user.push(userResult[0]);
    }
    return user;
  } catch (error) {
    throw error;
  }
}

module.exports = { retrieveUserProfile };