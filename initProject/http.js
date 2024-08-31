const { createServer } = require("node:http");

const hostname = "127.0.0.1";
const port = 3000;

const server = createServer((req, res) => {
  res.end("<h1>hello</h1>");
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

// const { exec } = require("child_process");

// exec("npm init -y", (error, stdout, stderr) => {
//   if (error) {
//     console.error(`Lỗi khi chạy npm init: ${error.message}`);
//     return;
//   }

//   if (stderr) {
//     console.error(`Cảnh báo: ${stderr}`);
//     return;
//   }

//   console.log(`Kết quả: ${stdout}`);
// });
