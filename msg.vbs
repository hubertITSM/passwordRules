Set objShell = CreateObject("Wscript.Shell")
intMessage = Msgbox( "A new password policy has been implemented on your device," & vbcrlf &_
 "the password will be forced to change the next time you log in"& vbcrlf &_
 "Would you like to learn about the new password rules?"& vbcrlf &_
 " "& vbcrlf &_
 "In case of any technical problems, conntact:" & vbcrlf &_
 "helpdesk@salesmanago.com",4148, "SalesManago Security")

If intMessage = vbYes Then
    objShell.Run("https://connect.salesmanago.com/channels/266764433/CompanyNews/discussion/78246056")
Else
    Wscript.Quit
End If