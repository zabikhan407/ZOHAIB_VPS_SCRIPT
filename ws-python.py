import socket, threading, thread, select, signal, sys, time, getopt

# SSH WebSocket Proxy for ZOHAIB_NETWORK
LISTENING_ADDR = '0.0.0.0'
LISTENING_PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 8880
PASS = 'HTTP/1.1 101 Switching Protocols\r\n\r\n'

def main():
    print "SSH WS Engine Started on Port", LISTENING_PORT
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((LISTENING_ADDR, LISTENING_PORT))
    server.listen(100)
    while True:
        client, addr = server.accept()
        threading.Thread(target=proxy, args=(client,)).start()

def proxy(client):
    client.sendall(PASS)
    target = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    target.connect(('127.0.0.1', 22))
    threading.Thread(target=forward, args=(client, target)).start()
    threading.Thread(target=forward, args=(target, client)).start()

def forward(source, destination):
    while True:
        data = source.recv(4096)
        if not data: break
        destination.sendall(data)

if __name__ == '__main__':
    main()
