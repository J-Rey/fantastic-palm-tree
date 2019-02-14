# fantastic-palm-tree
Windows scripts &amp; task to automate Let's Encrypt renewals with Crypt::LE (ZeroSSL) but with lots of flexibility

My client wanted to continue to not use IIS since WampServer was already setup and working fine. They used the certificate wizard at ZeroSSL.com to get one started but really needed help to automate the required & frequent renewal process that Let's Encrypt requires. After searching around it seemed most other Windows clients were setup to integrate with IIS so I decided to stay with ZeroSSL. At first I just setup a new task in Task Scheduler to run each renewal command separately but when things broke down for multiple reasons then I expanded things to make it more robust and now I'm sharing what I ended up with where this project includes:

* ZeroSSL Let's Encrypt cert renewal.xml - Task to import into Windows Task Manager to run CertRenew.cmd daily 
* CertRenew.cmd - NT Command Script (A batch file for Windows not DOS) to renew Let's Encrypt security certificate(s) and run sendEmail.ps1 if needed
* sendEmail.ps1 - Powershell Script that will send e-mail alert of something new when trying to renew Let's Encrypt security certificate(s)

A script is not provided to copy files to the default folders since you should read the comments in each file due to the many customizations that will be needed. Specifically you need to make sure to review & edit all domain & folder references, create the EmailPassword.txt file along with adding your own e-mail credentials. You'll also need to make sure the Windows binary file is ready (https://github.com/do-know/Crypt-LE/releases) and import the Scheduled Task. Make sure to refer to both https://github.com/do-know/Crypt-LE & https://zerossl.com/usage.html for further revisions if your setup is different.

A custom webpage will be created elsewhere for this soon and better first time instructions are being worked on at https://github.com/J-Rey/fantastic-palm-tree/wiki but in the meantime for support and alternate methods of communication please check with J-Rey here or via TechniSolutions at www.techni.solutions.
