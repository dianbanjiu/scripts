$current = Get-Location
Set-Location $HOME\Documents\just

go run main.go sub -w
$tmpErrAction=$ErrorActionPreference
$ErrorActionPreference='SilentlyContinue'
Get-Process -Name xray | Stop-Process
$ErrorActionPreference=$tmpErrAction

Start-Process -WindowStyle Hidden -FilePath xray "run -c $HOME\.config\xray\config.json"
Set-Location $current
