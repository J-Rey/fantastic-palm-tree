@echo off
REM NT Command Script that's designed to be ran by Windows Task Scheduler daily to renew Let's Encrypt security certificate(s)
REM This can be ran in command prompt if desired after changes are made or for further diagnosis of issues
REM Created by TechniSolutions (www.techni.solutions) to work with Crypt::LE (ZeroSSL project) provided Windows binaries

SET $domain=plcsource.com
C:\Windows\le64.exe --key "C:\wamp64\bin\apache\apache2.4.34\conf\key\account.key" --csr "C:\wamp64\bin\apache\apache2.4.34\conf\key\mydomain.csr" --csr-key "C:\wamp64\bin\apache\apache2.4.34\conf\key\domain.key" --crt "C:\wamp64\bin\apache\apache2.4.34\conf\key\domain.crt" --domains "www.plcsource.com,plcsource.com" --path "C:\wamp64\www\PLC\.well-known\acme-challenge" --generate-missing --unlink --email "info@techni.solutions,sales@plcsource.com" --renew 10 --issue-code 100 --live
REM if errorlevel 1 (call :typo)
if errorlevel 100 (call :renewal)
if errorlevel 255 (call :unknownerror)

SET $domain=jdperformanceauto.com
C:\Windows\le64.exe --key "C:\wamp64\bin\apache\apache2.4.34\conf\key\autoaccount.key" --csr "C:\wamp64\bin\apache\apache2.4.34\conf\key\autodomain.csr" --csr-key "C:\wamp64\bin\apache\apache2.4.34\conf\key\autodomain.key" --crt "C:\wamp64\bin\apache\apache2.4.34\conf\key\autodomain.crt" --domains "www.jdperformanceauto.com,jdperformanceauto.com" --path "C:\wamp64\www\Auto\.well-known\acme-challenge" --generate-missing --unlink --email "info@techni.solutions,sales@plcsource.com" --renew 10 --issue-code 100 --live
REM if errorlevel 1 (call :typo)
if errorlevel 100 (call :renewal)
if errorlevel 255 (call :unknownerror)

SET $domain=celltowerlease.us
C:\Windows\le64.exe --key "C:\wamp64\bin\apache\apache2.4.34\conf\key\toweraccount.key" --csr "C:\wamp64\bin\apache\apache2.4.34\conf\key\towerdomain.csr" --csr-key "C:\wamp64\bin\apache\apache2.4.34\conf\key\towerdomain.key" --crt "C:\wamp64\bin\apache\apache2.4.34\conf\key\towerdomain.crt" --domains "celltowerlease.us,www.celltowerlease.us" --path "C:\wamp64\www\Towers\.well-known\acme-challenge" --generate-missing --unlink --email "info@techni.solutions,sales@plcsource.com" --renew 10 --issue-code 100 --live
REM if errorlevel 1 (call :typo)
if errorlevel 100 (call :renewal)
if errorlevel 255 (call :unknownerror)

goto :eof

:renewal
REM This is triggered when the domain is successfully renewed where Apache needs to be restarted
REM Yes... using WAMP instead of IIS isn't normal but that's what my client already had & why Crypt::LE was chosen since its flexible enough
net stop wampapache64
net start wampapache64
powershell -ExecutionPolicy ByPass -File C:\Windows\sendEmail.ps1 %$domain% "Certificate Renewal"
EXIT /B

:typo
REM This is supposed to be triggered when there's a typo in the renewal command say when you first set this up or change anything with it but was being triggered unexpectedly so disabling its use till more testing can be done
powershell -ExecutionPolicy ByPass -File C:\Windows\sendEmail.ps1 %$domain% "Syntax Error"
EXIT /B

REM This is triggered when there's an Unknown Error which could cause failed renewal or other things
REM See also https://github.com/do-know/Crypt-LE#custom-exit-codes if you want to define more errors manually
:unknownerror
powershell -ExecutionPolicy ByPass -File C:\Windows\sendEmail.ps1 %$domain% "Unknown Error"
EXIT /B
