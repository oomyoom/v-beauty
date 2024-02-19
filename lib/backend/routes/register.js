var express = require("express");
var router = express.Router();
let dbCon = require("../lib/db");
const bcrypt = require("bcrypt");


router.post("/user", async (req, res) => {
    const { Email, Password , UserName} = req.body;

    if(!Email || !Password || !UserName) {
        return res.status(400).json({ message : "Plase Enter All Field"});
    }

    const query1 = `INSERT INTO app_users(Password, Email,UserName) VALUES(?,?,?)`;
    const query2 = `INSERT INTO app_user_roles(UserGroupID, UserID) VALUES(1,?)`
    const query3 = `INSERT INTO app_user_details(UserID, Email) VALUES(?,?)`;

    try {
        const hashPassword = await bcrypt.hash(Password, 10);
        dbCon.query(query1,[hashPassword,Email,UserName],(err, results, fields) => {
            if (err) {
                console.log("Error : ",err);
                return res.status(400).send();
            } else {
                const userId = results.insertId;
                dbCon.query(query2,[userId],(err) => {
                    if (err) {
                        console.log("On UserGroupID table Error : ",err);
                        return res.status(400).send();
                    }
                    dbCon.query(query3, [userId, Email], (err) => {
                        if (err) {
                            console.log("On app_user_details table Error : ", err);
                            return res.status(400).send();
                        }
                        return res.status(201).json({ message: "Success" });
                    });
                });
            }
        });
    } catch (err) {
        console.log(err);
        return res.status(500).send();
    }
});


router.post("/store", async (req, res) => {
    const { Email, Password , UserName} = req.body;

    if(!Email || !Password || !UserName) {
        return res.status(400).json({ message : "Plase Enter All Field"});
    }

    const query1 = `INSERT INTO app_users(Password, Email,UserName) VALUES(?,?,?)`;
    const query2 = `INSERT INTO app_user_roles(UserGroupID, UserID) VALUES(3,?)`

    try {
        const hashPassword = await bcrypt.hash(Password, 10);
        dbCon.query(query1,[hashPassword,Email,UserName],(err, results, fields) => {
            if (err) {
                console.log("Error : ",err);
                return res.status(400).send();
            } else {
                const userId = results.insertId;
                dbCon.query(query2,[userId],(err) => {
                    if (err) {
                        console.log("On UserGroupID table Error : ",err);
                        return res.status(400).send();
                    }
                    return res.status(201).json({ message : "Success"});
                });
            }
        });
    } catch (err) {
        console.log(err);
        return res.status(500).send();
    }
});


module.exports = router;