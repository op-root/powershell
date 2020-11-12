
---- New Active Directory account ----
$adname = $args[0]
$EmailAddress = $args[1]
$Name = $args[2]
$given = $args[3]
$initial = $args[4]
$lastname = $args[5]
$phone = $args[6]
$description = $args[7]
$office = $args[8]
$logon = $args[9]
$title = $args[10]
$department = $args[11]
$company = $args[12]
$password = $args[13]
$newpass = ConvertTo-SecureString -AsPlainText $password -Force

New-ADUser -SamAccountName:$adname -Name:"$Name" -EmailAddress:"$EmailAddress" -ChangePasswordAtLogon:1 -DisplayName:"$Name" -Initials:"$initial" -Surname:"$lastname" -GivenName:"$given" -OfficePhone:"$phone" -Description:"$description" -Office:"$office" -UserPrincipalName:"$logon@yourdomain.dom"-Title:"$title" -Department:"$department" -Company:"$company" -AccountPassword:$newpass -Type:"user"

Enable-ADAccount -Identity $adname

---- Reset password ----

Set-ADAccountPassword -Identity bob -OldPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force) -NewPassword (ConvertTo-SecureString -AsPlainText "qwert@12345" -Force)

---- In case user does not remember password ----

Set-ADAccountPassword -Identity bob -NewPassword (ConvertTo-SecureString -AsPlainText "qwert@12345" -Force)