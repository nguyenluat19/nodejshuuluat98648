import http from "node:http";
import { saveSystemInfoToFile } from "./home.js";

const server = http.createServer((req, res) => {
  if (req.url === "/save-system-info") {
    const filename = "systemInfo.json";
    saveSystemInfoToFile(filename);

    res.setHeader("Content-Type", "text/plain");
    res.writeHead(200);
    res.end(`Saving system info to ${filename}...`);
  } else {
    // Trang chính
    res.setHeader("Content-Type", "text/html");
    res.writeHead(200);
    res.end(`
      <html>
        <head><title>NGUYEN HUU LUAT</title></head>
        <body>
          <h1>NGUYEN HUU LUAT</h1>
          <button onclick="saveInfo()">Save Info to File</button>
          <script>
            function saveInfo() {
              fetch("/save-system-info")
                .then(response => response.text())
                .then(message => {
                  alert(message);
                });
            }
          </script>
        </body>
      </html>
    `);
  }
});

server.listen(3000, () => {
  console.log("Server đang chạy tại http://localhost:3000");
});
