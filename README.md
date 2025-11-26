# PsEasyTools
Includes many useful PowerShell mini-scripts for things like elevating to TrustedInstaller-level permissions, changing default double-click actions, and much more cool stuff to come! New items every Sunday (Except 11/30).
## EasySunday0 (Not a sunday) | E1-SH4D0W WelcomePackage
### DoubleClickRun.ps1
Simple script that auto-elevates and switches the default double click action for powershell scripts to run, instead of opening in notepad.

Use included RESET script to set things back the way they were.
### BecomeTI
Self-elevating script that opens a new CMD window with the user group NtAuthority\TrustedInstaller enabled. Use to anything your heart desires! (Within limits of course. EL SHADOW does not condone the use of their scripts for legal/illicit purposes and is not responsible for damage down to systems) DISCLAIMER: Some commands may still throw access-denied errors, due to ACLs or other weirdness. Google it if needed.
## Next EasySunday 11/30 (ES1):

- BootwareFinder
    - Locates and mounts hidden system partitions for exploration.
- AutorunAtlas
    - Lists all programs set to auto-start at boot, with ability to delete/disable.
