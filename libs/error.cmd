::::::::::::::::::::::::::::::
:: KoRec-DL error
::::::::::::::::::::::::::::::
@echo off

if %1 equ 110 (
  echo :: ^>^> KOREC_DIR が設定されていません
  echo "config.cmd" を確認してください。処理を中断します[err=%1]
)

if %1 equ 111 (
  echo :: ^>^> KOREC_DIR に設定されたフォルダに KoRec-DL.exe が見つかりません
  echo "config.cmd" を確認してください。処理を中断します[err=%1]
)

if %1 equ 112 (
  echo :: ^>^> KOREC_DIR に設定されたフォルダに KoRec.exe が見つかりません
  echo "config.cmd" を確認してください。処理を中断します[err=%1]
)

if %1 equ 120 (
  echo :: ^>^> DL_ROOT_DIR が設定されていません
  echo "config.cmd" を確認してください。処理を中断します[err=%1]
)

if %1 equ 121 (
  echo :: ^>^> DL_ROOT_DIR に設定された保存先ルートフォルダが見つかりません
  echo "config.cmd" を確認してください。処理を中断します[err=%1]
)


if %1 equ 210 (
  echo :: ^>^> SERVICE_NAME が設定されていません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認してください。処理をスキップします[err=%1]
)

if %1 equ 220 (
  echo :: ^>^> USE_LIST が設定されていません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認してください。処理をスキップします[err=%1]
)

if %1 equ 221 (
  echo :: ^>^>^>^> "%LIST_DIR_NAME%\korec-dl-downloadlist.xml" が見つかりません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認するか、
  echo "%LIST_DIR_NAME%\korec-dl-downloadlist.xml" を作成してください。処理をスキップします[err=%1]
)

if %1 equ 222 (
  echo :: ^>^>^>^> "%LIST_DIR_NAME%\%SERVICE_NAME:~1,-1%.xml" が見つかりません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認するか、
  echo "%LIST_DIR_NAME%\%SERVICE_NAME:~1,-1%.xml" を作成してください。処理をスキップします[err=%1]
)

if %1 equ 230 (
  echo :: ^>^> USE_FILTER が設定されていません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認してください。処理をスキップします[err=%1]
)

if %1 equ 231 (
  echo :: ^>^>^>^> "%FILTER_DIR_NAME%\%SERVICE_NAME:~1,-1%.xslt" が見つかりません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認するか、
  echo "%FILTER_DIR_NAME%\%SERVICE_NAME:~1,-1%.xslt" を作成してください。処理をスキップします[err=%1]
)

if %1 equ 240 (
  echo :: ^>^> USE_OUTPUT_LOG が設定されていません
  echo "%SERVICE_DIR_NAME%\%~nx2" の設定を確認してください。処理をスキップします[err=%1]
)

exit /b
