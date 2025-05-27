Write-Host "Downloading Debloater" -ForegroundColor Magenta
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Sycnex/Windows10Debloater/refs/heads/master/Windows10SysPrepDebloater.ps1" -OutFile "$env:USERPROFILE\Downloads\debloat.ps1"
Write-Host "Running Debloater" -ForegroundColor Magenta
# i dont know why i need this, i am the best programmer
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\Downloads\debloat.ps1" -Debloat -Privacy
Clear-Host

# Prepare array to store all app IDs
$appIds = @()

# Web Browsers
# dont *ever* put google chrome in this list.
Write-Host "Now the fun part: apps!" 
Write-Host "Web Browsers:" 
Write-Host "Firefox   [1]"
Write-Host "LibreWolf [2]" 
$WB = Read-Host "Please enter your choice, enter 0 for no browser"
switch -Regex ($WB) {
    "1" { $appIds += "Mozilla.Firefox" }
    "2" { $appIds += "LibreWolf.LibreWolf" }
}

Clear-Host

# Creative Apps
Write-Host "Creative Apps:" 
Write-Host "Blender            [1]"
Write-Host "Krita              [2]" 
Write-Host "Visual Studio      [3]" -ForegroundColor Magenta
Write-Host "Visual Studio Code [4]" -ForegroundColor Blue
Write-Host "MuseHub            [5]"
$CA = Read-Host "Please enter your choice, separate options with ',' like this '1,3,2' :   "
$CA_Split = $CA -split ','
foreach ($app in $CA_Split) {
    switch ($app.Trim()) {
        "1" { $appIds += "BlenderFoundation.Blender" }
        "2" { $appIds += "Krita.Krita" }
        "3" { $appIds += "Microsoft.VisualStudio.2022.Community" }
        "4" { $appIds += "Microsoft.VisualStudioCode" }
        "5" { $appIds += "Muse.MuseHub" }
    }
}

Clear-Host

# Utilities
Write-Host "Utilities:" 
Write-Host "VLC       [1]"
Write-Host "WizTree   [2]" 
Write-Host "Notepad++ [3]"
$UT = Read-Host "Please enter your choice, separate options with ',' like this '1,2' :   "
$UT_Split = $UT -split ','
foreach ($util in $UT_Split) {
    switch ($util.Trim()) {
        "1" { $appIds += "VideoLAN.VLC" }
        "2" { $appIds += "AntibodySoftware.WizTree" }
        "3" { $appIds += "Notepad++.Notepad++" }
    }
}
Clear-Host
Write-Host "Misc:" 
Write-Host "BambuStudio [1]"
Write-Host "PrusaSlicer [2]" 
Write-Host "OrcaSlicer  [3]"
Write-Host "Chocolatey  [4]"
$UT = Read-Host "Please enter your choice, separate options with ',' like this '1,2' :   "
$UT_Split = $UT -split ','
foreach ($util in $UT_Split) {
    switch ($util.Trim()) {
        "1" { $appIds += "Bambulab.Bambustudio"  }
        "2" { $appIds += "Prusa3D.PrusaSlicer"   }
        "3" { $appIds += "SoftFever.OrcaSlicer"  }
        "4" { $appIds += "Chocolatey.Chocolatey" }
    }
}
Clear-Host

# Remove any duplicates
$appIds = $appIds | Select-Object -Unique

# Install all selected apps at the end
if ($appIds.Count -gt 0) {
    Write-Host "Installing all selected apps with winget..." -ForegroundColor Green
    foreach ($id in $appIds) {
        winget install -e --id $id --accept-source-agreements --accept-package-agreements
    }
    Write-Host "All selected apps have been installed." -ForegroundColor Green
} else {
    Write-Host "No apps selected for installation." -ForegroundColor Yellow
}
