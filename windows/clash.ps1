# 加载 clash 的脚本

# 更新clash配置
$current = Get-Location
Set-Location C:\path\to\just
go run main.go sub -w

# 关闭正在运行的 clash 进程
$tmpErrAction=$ErrorActionPreference
$ErrorActionPreference='SilentlyContinue'
Get-Process -Name clash | Stop-Process
$ErrorActionPreference=$tmpErrAction

# 启动新的 clash 进程
Start-Process -WindowStyle Hidden -FilePath clash.exe
Set-Location $current
