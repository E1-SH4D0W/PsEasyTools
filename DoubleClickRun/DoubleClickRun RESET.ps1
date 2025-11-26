# Elevate to Admin priviliges (still requries the executing user to have the privliges to run, but rules out needing to run as admin)
if(-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $args";exit}

# Set reg keys to reset PS1 default double click action
Remove-Item "HKCU:\Software\Classes\.ps1" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "HKCU:\Software\Classes\Microsoft.PowerShellScript.1" -Recurse -Force -ErrorAction SilentlyContinue
exit 0