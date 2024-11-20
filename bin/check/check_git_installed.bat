:check_git_installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git chua duoc cai dat tren may tinh nay.
    echo Dang tai ve va cai dat Git...
    powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.1/Git-2.35.1-64-bit.exe /quiet /norestart' -NoNewWindow -Wait"
    git --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Khong the cai dat Git. Vui long cai dat thu cong tu: https://git-scm.com/download/win
        pause
        goto exit
    ) else (
        echo Git da duoc cai dat thanh cong tren may tinh nay.
    )
) else (
    echo Git da duoc cai dat tren may tinh nay.
)
ping localhost -n 2 >nul