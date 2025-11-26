# Elevate to Admin priviliges (still requries the executing user to have the privliges to run, but rules out needing to run as admin)
if(-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $args";exit}

# Set reg keys to change default double click action for PS scripts to execution
New-Item -Path "HKCU:\Software\Classes\.ps1" -Force |
Out-Null

New-Item -Path "HKCU:\Software\Classes\Microsoft.PowerShellScript.1\Shell\Open\Command" -Force |
Out-Null

Set-ItemProperty "HKCU:\Software\Classes\Microsoft.PowerShellScript.1\" `
    -Name "(Default)" -Value "Open"

Set-ItemProperty "HKCU:\Software\Classes\Microsoft.PowerShellScript.1\Shell\Open\Command" `
    -Name "(Default)" `
    -Value 'powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%1"'
exit 0