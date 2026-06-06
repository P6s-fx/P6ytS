@echo off
setlocal enabledelayedexpansion

:: Set the download directory to a specific folder in Downloads
set "download_path=%USERPROFILE%\Downloads\YouTube_Downloads"
if not exist "%download_path%" mkdir "%download_path%"

echo ============================================
echo      YOUTUBE DOWNLOADER (STAY OPEN MODE)
echo ============================================

:: 1. Check/Install yt-dlp
echo [*] Checking for yt-dlp...
where yt-dlp >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] yt-dlp not found. Installing latest version via pip...
    pip install -U yt-dlp
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to install yt-dlp. Please ensure Python is installed.
        pause
        exit /b
    )
) else (
    echo [OK] yt-dlp is ready.
)

:: 2. Check/Install ffmpeg
echo [*] Checking for ffmpeg...
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] ffmpeg not found. Attempting to install via winget...
    winget install gyan.ffmpeg
    echo [!] Note: If downloads fail, restart this script after installation.
) else (
    echo [OK] ffmpeg is ready.
)

echo.
echo --------------------------------------------
set /p "url=Enter the YouTube Link: "
echo --------------------------------------------
echo [V] Video (Best Quality MP4)
echo [M] Music (High Quality MP3)
echo --------------------------------------------
set /p "choice=Enter your choice (V/M): "

echo.
echo [*] Starting download...
echo [*] Files will be saved to: %download_path%
echo.

:: 4. Execute Command and stay in the directory
pushd "%download_path%"

if /i "%choice%"=="V" goto download_video
if /i "%choice%"=="M" goto download_music
echo [!] Invalid choice.
goto end_script

:download_video
echo [RUNNING] Downloading Video (Premiere Pro Compatible)...
yt-dlp -f "bestvideo[vcodec*=avc1]+bestaudio[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 "!url!"
if %errorlevel% neq 0 (
    echo [ERROR] Download failed.
    pause
)
goto end_script

:download_music
echo [RUNNING] Downloading Music...
yt-dlp -x --audio-format mp3 --audio-quality 192K "!url!"
if %errorlevel% neq 0 (
    echo [ERROR] Download failed.
    pause
)
goto end_script

:end_script
popd

echo.
echo ============================================
echo    TASK FINISHED! Check your folder above.
echo ============================================
pause
