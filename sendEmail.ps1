<#
	Powershell Script that's designed to be ran from another script to alert of something new when trying to renew Let's Encrypt security certificate(s)
	Revised by TechniSolutions (www.techni.solutions) from https://social.technet.microsoft.com/wiki/contents/articles/51506.powershell-automate-and-schedule-task-scheduler-sending-email-and-attachment.aspx to remove the attachment & pass on customizations to communicate which domain is affected and for what reason
#>

$User = "info@techni.solutions"
$File = "C:\Windows\EmailPassword.txt"
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)
$EmailTo = "j@techni.solutions"
$EmailFrom = "info@techni.solutions"
$Subject = "Certificate Renewal Script info for " + $Args[0]
$Body = "Hello. There was a " + $Args[1] + " for the " + $Args[0] + " domain. Please follow-up ASAP. Thanks!"
$SMTPServer ="smtp.office365.com"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($cred.UserName, $cred.Password);
$SMTPClient.Send($SMTPMessage)
