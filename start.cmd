::::::::::::::::::::::::::::::
:: KoRec-DL start script
::::::::::::::::::::::::::::::
@echo off
setlocal enabledelayedexpansion

set CURRENT=%~0\..
pushd "%CURRENT%"
cls

set SERVICE_DIR_NAME=conf\services
set LIST_DIR_NAME=conf\lists
set FILTER_DIR_NAME=conf\filters
set LOG_DIR_NAME=logs
set LIB_DIR_NAME=libs
set SERVICE_DIR="%CURRENT%\%SERVICE_DIR_NAME%"
set LIST_DIR="%CURRENT%\%LIST_DIR_NAME%"
set FILTER_DIR="%CURRENT%\%FILTER_DIR_NAME%"
set LOG_DIR="%CURRENT%\%LOG_DIR_NAME%"
set LIB_DIR="%CURRENT%\%LIB_DIR_NAME%"

set SLEEP_TIME=5

if not exist "%CURRENT%\conf\config.cmd" (
  call %LIB_DIR%\error.cmd 10
  goto :end
)

call %LIB_DIR%\check_config.cmd "%CURRENT%\conf\config.cmd"
if errorlevel 1 (
  call %LIB_DIR%\error.cmd %errorlevel%
  goto :end
)

for %%i in (%SERVICE_DIR%\*.cmd) do (
  call %LIB_DIR%\check_service.cmd "%%i"

  if errorlevel 1 (
    call %LIB_DIR%\error.cmd !errorlevel! "%%i"
    echo;
  ) else (
    call %LIB_DIR%\download.cmd
    echo ^>^> %SLEEP_TIME% •bŠÔ‘Ò‹@‚µ‚Ü‚·
    timeout /t %SLEEP_TIME% /nobreak >nul 2>&1
    echo;
  )
)

:end
echo KoRec-DL supporter ‚ğI—¹‚µ‚Ü‚·

if %USE_TASK_SCHEDULER% equ 0 (
  pause
)
endlocal
exit
