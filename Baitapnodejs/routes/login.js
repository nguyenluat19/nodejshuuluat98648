const express = require('express');
const fs = require('fs');
const path = require('path');
const router = express.Router();

router.get('/login', (req, res) => {
    res.render('login', { errorMessage: '' });
});

router.post('/login', (req, res) => {
    const { username, password } = req.body; 

    // Đọc file user.txt để lấy thông tin tài khoản lưu trữ
    const filePath = path.join(__dirname, '../user.txt');
    const data = fs.readFileSync(filePath, 'utf-8').split('\n'); // Đọc từng dòng của file

    let validUser = false;
    let userInfo = '';

    // Kiểm tra xem có khớp không
    data.forEach(line => {
        const [storedUser, storedPass] = line.split(','); // Tách username và password lưu trữ
        if (storedUser === username && storedPass.trim() === password.trim()) {
            validUser = true; 
            userInfo = `Username: ${storedUser}, Password: ${storedPass}`;
        }
    });

    // Nếu đúng thì hiênr thị
    if (validUser) {
        res.send(`<h1>Welcome, ${username}</h1><p>${userInfo}</p>`);
    } else {
        res.render('login', { errorMessage: 'Đăng nhập không thành công' });
    }
});

module.exports = router;
