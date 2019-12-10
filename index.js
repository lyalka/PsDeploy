const http = require('http');
const fs = require('fs');

var settings = JSON.parse(fs.readFileSync("./settings.json"));

const hostname = '127.0.0.1';
const port = settings.port;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World from port ' + port + ' !');
});

server.listen(port, hostname, () => {
  console.log('Server running at http://${hostname}:${port}/');
});