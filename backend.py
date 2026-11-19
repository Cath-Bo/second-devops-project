from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

class BackendHandler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"
    def do_GET(self):
        message = b"Hello from Python backend!"

        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(message)))
        self.end_headers()
        self.wfile.write(message)


server = ThreadingHTTPServer(("127.0.0.1", 8000), BackendHandler)

print("Backend running on port 8000")

server.serve_forever()
