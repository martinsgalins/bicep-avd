const http = require('http');

const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end(`
    <h1>Hello from Node.js</h1>
    <p>Deployed via GitHub Actions + Bicep</p>
    <p>Time: ${new Date().toISOString()}</p>
  `);
});

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});