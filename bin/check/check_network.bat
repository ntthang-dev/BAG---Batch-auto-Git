@echo off
setlocal enabledelayedexpansion
color 0a
cls

echo Dang kiem tra ket noi internet...

REM Chay lenh ipconfig /all va luu ket qua vao file tam thoi
ipconfig /all > ipconfig_temp.txt

REM Khoi tao bien kiem tra ket noi internet
set connected=false
set "gateway_ip="

REM Doc file tam thoi va tim dia chi IP cua Default Gateway
for /f "tokens=3 delims= " %%a in ('findstr /i /c:"Default Gateway" ipconfig_temp.txt') do (
    set gateway_ip=%%a
    REM Neu tim thay gateway hop le, danh dau la ket noi
    if not "!gateway_ip!"=="0.0.0.0" (
        set connected=true
    )
)

REM Neu co ket noi, su dung dia chi IP cua gateway de ping kiem tra internet
if "%connected%"=="true" (
    echo Da ket noi mang, dang kiem tra ket noi internet voi gateway !gateway_ip! ...
    ping !gateway_ip! -n 1 >nul 2>&1
    if %errorlevel% neq 0 (
        echo Khong co ket noi internet.
    ) else (
        echo Da ket noi internet.
    )
) else (
    echo Khong co ket noi mang.
)

REM Xoa file tam thoi
del ipconfig_temp.txt

.\bin\login_git.bat