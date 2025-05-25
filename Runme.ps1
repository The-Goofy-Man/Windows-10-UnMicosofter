Write-Host "Downloading Debloater" -ForegroundColor Magenta
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Sycnex/Windows10Debloater/refs/heads/master/Windows10SysPrepDebloater.ps1" -OutFile "~\Downloads\debloat.ps1"
Write-Host "Running Debloater" -ForegroundColor Magenta
~\downloads\debloat.ps1 -Debloat -Privacy
clear
Write-Host "Now the fun part: apps!" 
Write-Host "Web Browsers:" 
Write-Host "Firefox [1]"
Write-Host "LebreWolf [2]" 
$WB = Read-Host "Please enter your choice, enter 0 for no browser"
clear
Write-Host "Creative Apps:" 
Write-Host "Blender [1]"
Write-Host "Krita [2]" 
Write-Host "Visual Studio [3]" -ForegroundColor Magenta
Write-Host "Visual Studio Code [4]" -ForegroundColor Blue
Write-Host "MuseHub [5]"
$CA = Read-Host "Please enter your choice, seperate options with ',' like this '1,3,2' :   "
clear
Write-Host "Utilities:" 
Write-Host "VLC [1]"
Write-Host "WizTree [2]" 
Write-Host "Notepad ++ [3]"
$UT = Read-Host "Please enter your choice, seperate options with ',' like this '1,2 :   "
clear
Write-Host "Misc:" 
Write-Host "VLC [1]"
Write-Host "WizTree [2]" 
Write-Host "Notepad ++ [3]"
$UT = Read-Host "Please enter your choice, seperate options with ',' like this '3,1,2 :   "
