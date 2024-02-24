const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

app.use(bodyParser.json());

const userRouter = require("./routes/auth");
app.use("/auth", userRouter);

const getDataRouter = require("./routes/getdata");
app.use("/getdata", getDataRouter);

const postRegister = require("./routes/register");
app.use("/register", postRegister);

const getUser = require("./routes/user");
app.use("/user", getUser);

const order = require("./routes/order");
app.use("/order", order);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
