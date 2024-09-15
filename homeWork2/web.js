import http from "node:http";
import { getSystemInfo } from "./home.js";
const server = http.createServer((req, res) => {
  if (req.url === "/system-info") {
    const systemInfo = getSystemInfo();

    res.setHeader("Content-Type", "application/json");
    res.writeHead(200);
    res.end(JSON.stringify(systemInfo, null, 2));
  } else {
    res.writeHead(200);
    res.end(`
      <html>
        <head><title>NGUYEN HUU LUAT</title></head>
        <body>
          <h1>THONG TIN LAPTOP</h1>
          <pre id="system-info"></pre>
          <script>
            fetch("/system-info") 
              .then(response => response.json())
              .then(data => {
                const systemInfoElement = document.getElementById("system-info");
                systemInfoElement.textContent = JSON.stringify(data, null, 2);  
              })
              .catch(error => console.error("Error fetching system info:", error));
          </script>
        </body>
      </html>
    `);
  }
});

// Server sẽ lắng nghe ở cổng 3000
server.listen(3000, () => {
  console.log("Server đang chạy tại http://localhost:3000");
});
