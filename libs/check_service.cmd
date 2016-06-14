::::::::::::::::::::::::::::::
:: check service
::::::::::::::::::::::::::::::
@echo off

call %1
cd >nul 2>&1

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo :: "%SERVICE_DIR_NAME%\%~nx1" の設定チェック...

::::::::::::::::::::::::::::::
rem SERVICE_NAME
::::::::::::::::::::::::::::::
if not defined SERVICE_NAME (
  exit /b 210
)
if %SERVICE_NAME%=="" (
  exit /b 210
)

echo :: ^>^> SERVICE_NAME OK. [%SERVICE_NAME%]

::::::::::::::::::::::::::::::
rem USE_LIST
::::::::::::::::::::::::::::::
if not defined USE_LIST (
  exit /b 220
)
if %USE_LIST%=="" (
  exit /b 220
)

echo :: ^>^> USE_LIST OK. [%USE_LIST%]

call :check_exist_list
if errorlevel 1 (
  exit /b %errorlevel%
)

::::::::::::::::::::::::::::::
rem USE_FILTER
::::::::::::::::::::::::::::::
if not defined USE_FILTER (
  exit /b 230
)
if %USE_FILTER%=="" (
  exit /b 230
)

echo :: ^>^> USE_FILTER OK. [%USE_FILTER%]

call :check_exist_filter
if errorlevel 1 (
  exit /b %errorlevel%
)

::::::::::::::::::::::::::::::
rem USE_OUTPUT_LOG
::::::::::::::::::::::::::::::
if not defined USE_OUTPUT_LOG (
  exit /b 240
)
if %USE_OUTPUT_LOG%=="" (
  exit /b 240
)

if not exist %LOG_DIR%\ (
  mkdir %LOG_DIR%
)

echo :: ^>^> USE_OUTPUT_LOG OK. [%USE_OUTPUT_LOG%]

echo :: "%SERVICE_DIR_NAME%\%~nx1" の設定チェック OK.
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

exit /b

:check_exist_list
if %USE_LIST% equ 0 (
  if not exist "%LIST_DIR%\korec-dl-downloadlist.xml" (
    exit /b 221
  ) else (
    echo :: ^>^>^>^> "%LIST_DIR_NAME%\korec-dl-downloadlist.xml" OK.
    exit /b
  )
)
if %USE_LIST% geq 1 (
  if not exist "%LIST_DIR%\%SERVICE_NAME:~1,-1%.xml" (
    exit /b 222
  ) else (
    echo :: ^>^>^>^> "%LIST_DIR_NAME%\%SERVICE_NAME:~1,-1%.xml" OK.
    exit /b
  )
)
exit /b

:check_exist_filter
if %USE_FILTER% geq 1 (
  if not exist "%FILTER_DIR%\%SERVICE_NAME:~1,-1%.xslt" (
    exit /b 231
  ) else (
    echo :: ^>^>^>^> "%FILTER_DIR_NAME%\%SERVICE_NAME:~1,-1%.xslt" OK.
    exit /b
  )
)
exit /b
