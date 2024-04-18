gpupdate /force
secedit /export /cfg CurrentSecurityPolicy.inf
$PasswordComplexity = 1
$MinimumPasswordLength = 12 
$PasswordHistorySize = 5 
$MaximumPasswordAge = 180
(Get-Content -Path CurrentSecurityPolicy.inf) -replace 'PasswordComplexity = .+', "PasswordComplexity = $PasswordComplexity" ` 
    -replace 'MinimumPasswordLength = .+', "MinimumPasswordLength = $MinimumPasswordLength" ` 
    -replace 'PasswordHistorySize = .+', "PasswordHistorySize = $PasswordHistorySize" ` 
    -replace 'MaximumPasswordAge = .+', "MaximumPasswordAge = $MaximumPasswordAge" | 
    Set-Content -Path ModifiedSecurityPolicy.inf 
secedit /configure /db c:\windows\security\local.sdb /cfg ModifiedSecurityPolicy.inf /areas SECURITYPOLICY 
Remove-Item -Path CurrentSecurityPolicy.inf 
Remove-Item -Path ModifiedSecurityPolicy.inf 
