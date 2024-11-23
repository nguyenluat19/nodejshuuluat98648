const express = require("express");
const bodyParser = require("body-parser");
const fs = require("fs");
const path = require("path");
const app = express();
const bookingRoutes = require("./routes/booking");

app.use(bodyParser.urlencoded({ extended: true }));

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

const dataFilePath = path.join(__dirname, "data.json");

app.get("/", (req, res) => {
  const data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  res.render("index", { bookings: data });
});
app.use("/bookings", bookingRoutes);

app.get("/new", (req, res) => {
  res.render("new");
});

app.post("/add", (req, res) => {
  const { customerName, date, time } = req.body;

  if (!customerName || !date || !time) {
    return res.status(400).send("Vui lòng nhập đầy đủ thông tin.");
  }

  const data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const newBooking = {
    id: data.length > 0 ? data[data.length - 1].id + 1 : 1,
    customerName,
    date,
    time,
    status: "Pending",
  };

  data.push(newBooking);

  fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2), "utf8");

  res.redirect("/");
});

const port = 5000;
app.listen(port, () => {
  console.log(`Server chạy tại http://localhost:${port}`);
});
