::::::::::::::::::::::::::::::
:: check conf\config.cmd
::::::::::::::::::::::::::::::
@echo off

call %1
cd >nul 2>&1

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: "conf\config.cmd" の設定チェック...

::::::::::::::::::::::::::::::
rem KOREC_DIR
::::::::::::::::::::::::::::::
if not defined KOREC_DIR (
  exit /b 110
)
if %KOREC_DIR%=="" (
  exit /b 110
)
if not exist %KOREC_DIR%\KoRec-DL.exe (
  exit /b 111
)
if not exist %KOREC_DIR%\KoRec.exe (
  exit /b 112
)

echo :: ^>^> KOREC_DIR OK.

::::::::::::::::::::::::::::::
rem DL_ROOT_DIR
::::::::::::::::::::::::::::::
if not defined DL_ROOT_DIR (
  exit /b 120
)
if %DL_ROOT_DIR%=="" (
  exit /b 120
)
if not exist %DL_ROOT_DIR% (
  exit /b 121
)

echo :: ^>^> DL_ROOT_DIR OK.

echo :: "conf\config.cmd" の設定チェック OK.
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo;

exit /b
