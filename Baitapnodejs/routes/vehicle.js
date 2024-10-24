const express = require('express');
const fs = require('fs');
const path = require('path');

// Tạo router
const router = express.Router();

const vehicleData = JSON.parse(fs.readFileSync(path.join(__dirname, '../vehicle_plates.json')));

// hiển thi danh sách trong json
router.get('/', (req, res) => {
  res.render('vehicle', { vehicleData, selectedCity: null, plateNumber: null });
});

// Route POST để xử lýs tra cứu biển sôs
router.post('/getPlate', (req, res) => {
  const selectedCity = req.body.city;
  const cityData = vehicleData.find((item) => item.city === selectedCity);
  const plateNumber = cityData ? cityData.plate_no : 'Không tìm thấy';

  res.render('vehicle', { vehicleData, selectedCity, plateNumber });
});

module.exports = router;
