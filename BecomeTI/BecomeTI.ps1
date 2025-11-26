# Elevate to Admin priviliges (still requries the executing user to have the privliges to run, but rules out needing to run as admin)
if(-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $args";exit}

# Check to make sure NtObjectManager is installed
$MissingModules = "NtObjectManager" | Where-Object {
    -not (Get-Module -Name $_ -ListAvailable)
}

# Install if not
if ($MissingModules.Count -ne 0) { Install-Module NtObjectManager -Scope CurrentUser -Force -Confirm:$false }

# Import it
Import-Module NtObjectManager -Scope Process -Force

# Start TI, pipe output to Out-Null to suppress output
sc.exe start TrustedInstaller | Out-Null
# Extract process key of TI, assign to var $p
$p = Get-NtProcess TrustedInstaller.exe
# Start new command window with TI privliges
New-Win32Process cmd.exe -CreationFlags NewConsole -ParentProcess $p
exit 0