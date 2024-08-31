const http = require("node:http");
http
  .createServer((request, response) => {
    // response.write("<html>");
    // response.write("<body>");
    response.write("<h1>Hello +  World!</h1>");
    // response.write("</body>");
    // response.write("</html>");
    response.end();
  })
  .listen(8080);
