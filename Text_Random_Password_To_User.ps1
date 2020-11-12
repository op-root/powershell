---- Random password, text random password to user ----

$adname=$args[0]
#adname="training2"
 
$randompassword = Get-Random -minimum 100 -maximum 900
$rand = "Secret" + $randompassword
echo $rand
 
Set-ADAccountPassword -Identity $adname -NewPassword (ConvertTo-SecureString -AsPlainText "$rand" -Force) -Reset -PassThru | Set-ADuser -ChangePasswordAtLogon $True
 
$users = $i = $null
$users=get-aduser $adname -properties mobilephone
ForEach($user in $users)
{
                $Mobile=$user.MobilePhone
}
Out-File -encoding ASCII "C:\ProgramData\OpConxps\SAM\MSGIN\adname.txt" -InputObject ("`$NOTIFY:EMAIL`," + $Mobile + "@vtext.com,,,Account updated,Your password is $rand. The password must be changed before logging on the first time.,ocadm,password")
