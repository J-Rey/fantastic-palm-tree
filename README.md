# fantastic-palm-tree
Windows scripts &amp; task to automate Let's Encrypt renewals with Crypt::LE (ZeroSSL)

My client wanted to continue to not use IIS since WampServer was already setup and working fine. They used the certificate wizard at ZeroSSL.com to get one started but really needed help to keep things going. So I setup a new task in Task Scheduler to run each renewal command separately but when it didn't work for multiple reasons then I expanded things and now this project includes:

* CertRenew.cmd - NT Command Script (batch file) that's designed to be ran by Windows Task Scheduler daily to renew Let's Encrypt security certificate(s)
* sendEmail.ps1 - Powershell Script that's designed to be ran from another script to alert of something new when trying to renew Let's Encrypt security certificate(s)
* ZeroSSL Let's Encrypt cert renewal.xml - Task to import into Task Manager

A script is not provided to copy files to the default folders since you should read the comments in each file since lots of customizations will be needed. Specifically you need to make sure to review & edit all domain & folder references, create the EmailPassword.txt file along with adding your own e-mail credentials. You'll also need to download the Windows binaries (https://github.com/do-know/Crypt-LE/releases) and import the Scheduled Task. Make sure to refer to both https://github.com/do-know/Crypt-LE & https://zerossl.com/usage.html for further revisions if your setup is different.

A custom webpage will be created elsewhere for this soon and better instructions but in the meantime for support and alternate methods of communication please check with TechniSolutions at www.techni.solutions.
