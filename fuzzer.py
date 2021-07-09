#!/usr/bin/env python3

import socket, time, sys

ip = "127.0.0.1"

port = 9999
timeout = 5
prefix = ""
string = prefix + "A" * 150

while True:
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(timeout)
            s.connect((ip, port))

            print("Fuzzing with {} bytes".format(len(string) - len(prefix)))
            s.send(bytes(string + '\n', 'utf8'))
            s.recv(1024)
    except Exception as e:
        print("Fuzzing crashed at {} bytes {}".format(len(string) - len(prefix), e))
        sys.exit(0)
    string += 100 * "A"
    time.sleep(1)
