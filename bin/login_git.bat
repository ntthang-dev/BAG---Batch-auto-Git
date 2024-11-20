@echo off
setlocal enabledelayedexpansion
color 0a
cls

:start_animation
echo *************************************************************
ping localhost -n 1 >nul
echo *                                                           *
ping localhost -n 1 >nul
echo *   ________   _____   ______  ______  __  __  _____        *
ping localhost -n 1 >nul
echo *  /\_____  \ /\  __`\/\__  _\/\  _  \/\ \/\ \/\  __`\      *
ping localhost -n 1 >nul
echo *  \/____//'/'\ \ \/\ \/_/\ \/\ \ \L\ \ \ `\\ \ \ \/\ \     *
ping localhost -n 1 >nul
echo *       //'/'  \ \ \ \ \ \ \ \ \ \  __ \ \ , ` \ \ \ \ \    *
ping localhost -n 1 >nul
echo *      //'/'___ \ \ \_\ \ \ \ \ \ \ \/\ \ \ \`\ \ \ \_\ \   *
ping localhost -n 1 >nul
echo *      /\_______\\ \_____\ \ \_\ \ \_\ \_\ \_\ \_\ \_____\  *
ping localhost -n 1 >nul
echo *      \/_______/ \/_____/  \/_/  \/_/\/_/\/_/\/_/\/_____/  *
ping localhost -n 1 >nul
echo *                                                           *
ping localhost -n 1 >nul
echo *************************************************************
ping localhost -n 3 >nul
echo Loading. Please Wait...
ping localhost -n 5 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo                                    =   0 ]
echo    ---------------------------------------
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
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.          Please Wait
echo    ---------------------------------------
echo    []                              =   5 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
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
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading..         Please Wait
echo    ---------------------------------------
echo    [][]                            =  15 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo    [][][]                          =  23 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
:check_git_version
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
    @REM powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://github.com/git-for-windows/git/releases/download/%latest_version%/Git-%latest_version%-64-bit.exe /quiet /norestart' -NoNewWindow -Wait"
    git update-git-for-windows

    git --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Khong the cai dat phien ban Git moi nhat. Vui long cai dat thu cong tu: https://git-scm.com/download/win
    ) else (
        echo Phien ban Git moi nhat da duoc cai dat thanh cong tren may tinh nay.
    )
)
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.          Please Wait
echo    ---------------------------------------
echo    [][][][]                        =  30 ]
echo    ---------------------------------------
ping localhost -n 4 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading..         Please Wait
echo    ---------------------------------------
echo    [][][][][]                      =  38 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo    [][][][][]                      =  42 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.          Please Wait
echo    ---------------------------------------
echo    [][][][][][]                    =  45 ]
echo    ---------------------------------------
ping localhost -n 1 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading..         Please Wait
echo    ---------------------------------------
echo    [][][][][][][]                  =  48 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo    [][][][][][][][]                =  50 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.           Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][]              =  56 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading..         Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][]            =  63 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][][]          =  69 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.          Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][][][]        =  75 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading..         Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][][][][]      =  79 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading...        Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][][][][][]    =  86 ]
echo    ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo        Loading.          Please Wait
echo    ---------------------------------------
echo    [][][][][][][][][][][][][][][]  =  90 ]
echo    ---------------------------------------
ping localhost -n 3 >nul
cls
echo Loading completed..
ping localhost -n 2 >nul

:menu
cls
echo +======================================================+
echo + ███████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗ ██████╗   +
echo +╚══███╔╝██╔═══██╗╚══██╔══╝██╔══██╗████╗  ██║██╔═══██╗    +
echo +  ███╔╝ ██║   ██║   ██║   ███████║██╔██╗ ██║██║   ██║   + 
echo + ███╔╝  ██║   ██║   ██║   ██╔══██║██║╚██╗██║██║   ██║   +
echo +███████╗╚██████╔╝   ██║   ██║  ██║██║ ╚████║╚██████╔╝   +    
echo +╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝    +
echo +=====================================================+
ping localhost -n 3 > nul 
cls
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo.
echo    ========================================
echo    =            CHON NGON NGU             =
echo    ========================================
echo.
echo    [1] Tieng Viet
echo    [2] English
echo.
echo    ========================================
set /p lang_choice="Nhap lua chon cua ban (1/2): "

if "%lang_choice%"=="1" goto menu_vn
if "%lang_choice%"=="2" goto menu_en
echo Lua chon khong hop le. Vui long thu lai.
pause
goto menu

:menu_vn
cls
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo       ========================================
echo                  CHON CHUC NANG
echo       ========================================
echo.
echo      [1] Dang nhap Git
echo      [2] Kiem tra thong tin dang nhap Git
echo      [3] Xoa thong tin dang nhap Git
echo      [4] Doc huong dan su dung
echo      [5] Thoat ung dung
echo.
echo      ========================================
set /p choice_vn="Nhap lua chon cua ban (1/2/3/4/5): "

if "%choice_vn%"=="1" goto login_vn
if "%choice_vn%"=="2" goto check_vn
if "%choice_vn%"=="3" goto delete_vn
if "%choice_vn%"=="4" goto guide_vn
if "%choice_vn%"=="5" goto exit
echo Lua chon khong hop le. Vui long thu lai.
pause
goto menu_vn

:login_vn
cls
echo **********************************************
echo              DANG NHAP GIT                 
echo **********************************************
set /p username="Nhap ten nguoi dung: "
set /p email="Nhap dia chi email: "
git config --global user.name "%username%"
git config --global user.email "%email%"
echo Da dang nhap thanh cong voi ten nguoi dung: %username%
pause
goto back_to_menu_vn

:check_vn
cls
echo **********************************************
echo          KIEM TRA THONG TIN DANG NHAP      
echo **********************************************
git config --global user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo Ban chua dang nhap Git.
) else (
    echo Ten nguoi dung:
    git config --global user.name
    echo.
    echo Email:
    git config --global user.email
)
pause
goto back_to_menu_vn

:delete_vn
cls
echo **********************************************
echo         XOA THONG TIN DANG NHAP GIT        
echo **********************************************
git config --global --unset user.name
git config --global --unset user.email
echo Da xoa thong tin dang nhap.
pause
goto back_to_menu_vn

:guide_vn
cls
echo **********************************************
echo              HUONG DAN SU DUNG                 
echo **********************************************
echo 1. Lua chon 1 de dang nhap Git.
echo 2. Lua chon 2 de kiem tra thong tin dang nhap Git.
echo 3. Lua chon 3 de xoa thong tin dang nhap Git.
echo 4. Lua chon 4 de doc huong dan su dung.
echo 5. Lua chon 5 de thoat ung dung.
pause
goto back_to_menu_vn

:back_to_menu_vn
cls
echo Da thuc hien xong. Quay lai menu chinh.
pause
goto menu_vn

:menu_en
cls
echo    **********************************************
echo    *                                            *
echo    *                 ZOTANO                     *
echo    *                                            *
echo    *       Author: Nguyen Trong Thang           *
echo    *       Created: November 20, 2024           *
echo    *       License: MIT License                 *
echo    **********************************************
echo       ========================================
echo                  SELECT OPTION
echo       ========================================
echo.
echo      [1] Login to Git
echo      [2] Check Git login info
echo      [3] Delete Git login info
echo      [4] Read user guide
echo      [5] Exit application
echo.
echo      ========================================
set /p choice_en="Enter your choice (1/2/3/4/5): "

if "%choice_en%"=="1" goto login_en
if "%choice_en%"=="2" goto check_en
if "%choice_en%"=="3" goto delete_en
if "%choice_en%"=="4" goto guide_en
if "%choice_en%"=="5" goto exit
echo Invalid choice. Please try again.
pause
goto menu_en

:login_en
cls
echo **********************************************
echo              LOGIN TO GIT                 
echo **********************************************
set /p username="Enter username: "
set /p email="Enter email address: "
git config --global user.name "%username%"
git config --global user.email "%email%"
echo Successfully logged in with username: %username%
pause
goto back_to_menu_en

:check_en
cls
echo Loading. Please Wait
ping localhost -n 2 >nul

echo **********************************************
echo          CHECK GIT LOGIN INFO      
echo **********************************************
git config --global user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo You are not logged in to Git.
) else (
    echo Username:
    git config --global user.name
    echo.
    echo Email:
    git config --global user.email
)
pause
goto back_to_menu_en

:delete_en
cls
echo **********************************************
echo         DELETE GIT LOGIN INFO        
echo **********************************************
git config --global --unset user.name
git config --global --unset user.email
echo Deleted Git login info.
pause
goto back_to_menu_en

:guide_en
cls
echo **********************************************
echo              USER GUIDE                 
echo **********************************************
echo 1. Choose 1 to login to Git.
echo 2. Choose 2 to check Git login info.
echo 3. Choose 3 to delete Git login info.
echo 4. Choose 4 to read the user guide.
echo 5. Choose 5 to exit the application.
pause
goto back_to_menu_en

:back_to_menu_en
cls
echo Task completed. Returning to main menu.
pause
goto menu_en

:exit
exit