var http = require('http');
var fs = require('fs');

http.createServer(function (request, response) {
	if (request.url == '/') {
		fs.readFile('./hello.html', function(err, data) {
			response.writeHead(200, {'Content-Type': 'text/html'});
			response.end(data);
		})
	}
}).listen(8888);

// 终端打印如下信息
console.log('Server running at http://127.0.0.1:8888/');
