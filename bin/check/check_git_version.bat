REM Kiểm tra phiên bản Git hiện tại
for /f "tokens=3" %%a in ('git --version 2^>nul') do set "current_version=%%a"

REM Tải về phiên bản mới nhất từ GitHub
echo Dang kiem tra phien ban moi nhat...
powershell -Command "(Invoke-WebRequest -Uri 'https://api.github.com/repos/git-for-windows/git/releases/latest').Content" > latest_release.json

REM Trích xuất phiên bản mới nhất từ JSON
for /f "delims=" %%a in ('findstr /i /c:"tag_name" latest_release.json') do set "latest_version=%%a"
set "latest_version=%latest_version:*"="%
set "latest_version=%latest_version:~, -%
del latest_release.json

echo Phien ban Git hien tai: %current_version%
echo Phien ban Git moi nhat: %latest_version%

REM So sánh phiên bản hiện tại và phiên bản mới nhất
if "%current_version%"=="%latest_version%" (
    echo Ban dang su dung phien ban Git moi nhat.
) else (
    echo Ban dang su dung phien ban Git cu. Dang tai va cai dat phien ban moi nhat...
    REM Tải và cài đặt phiên bản Git mới nhất
    powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://github.com/git-for-windows/git/releases/download/%latest_version%/Git-%latest_version%-64-bit.exe /quiet /norestart' -NoNewWindow -Wait"
    git --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Khong the cai dat phien ban Git moi nhat. Vui long cai dat thu cong tu: https://git-scm.com/download/win
    ) else (
        echo Phien ban Git moi nhat da duoc cai dat thanh cong tren may tinh nay.
    )
)
ping localhost -n 3 >nul