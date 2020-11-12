
---- Unlock Active Directory account ----
$adname=$args[0]
Unlock-ADAccount -Identity $adname


---- Unlock Active Directory account, look up mobile number, and send text ----
$adname=$args[0]
Unlock-ADAccount -Identity $adname
 
$users = $i = $null
$users=get-aduser $adname -properties mobilephone
ForEach($user in $users)
{
                $Mobile=$user.MobilePhone
}
Out-File -encoding ASCII "C:\ProgramData\OpConxps\SAM\MSGIN\adname.txt" -InputObject ("`$NOTIFY:EMAIL`," + $Mobile + "@vtext.com,,,Your account is unlocked,Please let us know,ocadm,password")
