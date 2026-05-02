import socket, threading, sys
def forward(source, destination):
    try:
        while True:
            data = source.recv(4096)
            if not data: break
            destination.sendall(data)
    except: pass
def proxy(client):
    try:
        client.sendall(b'HTTP/1.1 101 Switching Protocols\r\n\r\n')
        target = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        target.connect(('127.0.0.1', 22))
        threading.Thread(target=forward, args=(client, target)).start()
        threading.Thread(target=forward, args=(target, client)).start()
    except: client.close()
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('0.0.0.0', 8880))
server.listen(100)
while True:
    client, addr = server.accept()
    threading.Thread(target=proxy, args=(client,)).start()
