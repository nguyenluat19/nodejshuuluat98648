const express = require("express");
const fs = require("fs");
const path = require("path");
const router = express.Router();
const dataFilePath = path.join(__dirname, "../data.json");
// Lấy danh sách đặt chỗ từ data.json
router.get("/", (req, res) => {
  const data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  res.render("index", { bookings: data });
});

// Thêm đặt chỗ mới
router.post("/", (req, res) => {
  const { customerName, date, time } = req.body;
  const data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const newId = data.length ? data[data.length - 1].id + 1 : 1;
  const newBooking = {
    id: newId,
    customerName,
    date,
    time,
    status: "Pending",
  };
  const exists = data.find(
    (booking) => booking.date === date && booking.time === time
  );
  if (exists) {
    return res.send("Đặt chỗ đã tồn tại tại thời gian này.");
  }

  data.push(newBooking);
  fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2));
  res.redirect("/");
});

// // Xóa đặt chỗ
router.post("/delete/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  let data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const updatedBookings = data.filter((b) => b.id !== id);
  if (updatedBookings.length < data.length) {
    data = updatedBookings;
    fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2));
    res.redirect("/");
  } else {
    res.status(404).send("Không tìm thấy đặt chỗ.");
  }
});
// hủy trạng thái

router.post("/cancel/:id", (req, res) => {
  const id = parseInt(req.params.id, 10); // Lấy ID từ URL
  let data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const bookingIndex = data.findIndex((b) => b.id === id);
  if (bookingIndex !== -1) {
    data[bookingIndex].status = "Cancelled";
    fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2));
    res.redirect("/");
  } else {
    res.status(404).send("Không tìm thấy đặt chỗ.");
  }
});

// Xử lý cập nhật thông tin đặt chỗ
router.post("/edit/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  bookings = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const bookingIndex = bookings.findIndex((b) => b.id === id);
  if (bookingIndex !== -1) {
    bookings[bookingIndex] = {
      ...bookings[bookingIndex],
      customerName: req.body.customerName,
      date: req.body.date,
      time: req.body.time,
    };
    fs.writeFileSync(dataFilePath, JSON.stringify(bookings, null, 2), "utf8");
    res.redirect("/");
  } else {
    res.status(404).send("Không tìm thấy đặt chỗ.");
  }
});

// Hiển thị form sửa thông tin đặt chỗ
router.get("/edit/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  bookings = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const booking = bookings.find((b) => b.id === id);
  if (booking) {
    res.render("edit", { booking });
  } else {
    res.status(404).send("Không tìm thấy đặt chỗ.");
  }
});

router.post("/add", (req, res) => {
  const { customerName, date, time } = req.body;
  if (!customerName || !date || !time) {
    return res.status(400).send("Vui lòng nhập đầy đủ thông tin.");
  }
  const data = JSON.parse(fs.readFileSync(dataFilePath, "utf8"));
  const newBooking = {
    id: data.length > 0 ? data[data.length - 1].id + 1 : 1, // Tự động tăng ID
    customerName,
    date,
    time,
    status: "Pending",
  };
  data.push(newBooking);
  fs.writeFileSync(dataFilePath, JSON.stringify(data, null, 2), "utf8");
  res.redirect("/");
});

module.exports = router;
