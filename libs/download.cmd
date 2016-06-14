::::::::::::::::::::::::::::::
:: KoRec-DL download
::::::::::::::::::::::::::::::
@echo off
setlocal

echo サービス名: %SERVICE_NAME%

call :check_download_dir
echo ^>^> %DL_DIR% に移動します
pushd %DL_DIR%

call :generate_korec_param
echo ^>^> KoRec-DL を実行します

"%KOREC_DIR:~1,-1%\KoRec-DL.exe" %KOREC_PARAM%
echo ^>^> KoRec-DL の実行が終了しました

popd
endlocal
exit /b


:check_download_dir
if not exist %DL_ROOT_DIR%\%SERVICE_NAME%\ (
  mkdir %DL_ROOT_DIR%\%SERVICE_NAME%
)
set DL_DIR="%DL_ROOT_DIR:~1,-1%\%SERVICE_NAME:~1,-1%"
exit /b

:generate_korec_param
if %USE_LIST% geq 1 (
  set LIST=-open "%LIST_DIR:~1,-1%\%SERVICE_NAME:~1,-1%.xml"
) else (
  set LIST=-open "%LIST_DIR:~1,-1%\korec-dl-downloadlist.xml"
)

if %USE_FILTER% geq 1 (
  set FILTER= -xslt "%FILTER_DIR:~1,-1%\%SERVICE_NAME:~1,-1%.xslt"
) else (
  set FILTER=
)

if %USE_OUTPUT_LOG% geq 1 (
  set LOG= -logfile "%LOG_DIR:~1,-1%\%SERVICE_NAME:~1,-1%.log.txt"
) else (
  set LOG=
)

::echo LIST=%LIST%
::echo FILTER=%FILTER%
::echo LOG=%LOG%

set KOREC_PARAM=%LIST%%FILTER%%LOG% -update -download -batch

exit /b
