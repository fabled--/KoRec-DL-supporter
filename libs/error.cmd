::::::::::::::::::::::::::::::
:: KoRec-DL error
::::::::::::::::::::::::::::::
@echo off

if %1 equ 10 (
  set USE_TASK_SCHEDULER=1
  echo ^>^> "conf\config.cmd" ��������܂���
  echo "conf\config.cmd" ���쐬���Ă��������B�����𒆒f���܂�[err=%1]
  echo;
)

if %1 equ 110 (
  echo :: ^>^> KOREC_DIR ���ݒ肳��Ă��܂���
  echo "config.cmd" ���m�F���Ă��������B�����𒆒f���܂�[err=%1]
)

if %1 equ 111 (
  echo :: ^>^> KOREC_DIR �ɐݒ肳�ꂽ�t�H���_�� KoRec-DL.exe ��������܂���
  echo "config.cmd" ���m�F���Ă��������B�����𒆒f���܂�[err=%1]
)

if %1 equ 112 (
  echo :: ^>^> KOREC_DIR �ɐݒ肳�ꂽ�t�H���_�� KoRec.exe ��������܂���
  echo "config.cmd" ���m�F���Ă��������B�����𒆒f���܂�[err=%1]
)

if %1 equ 120 (
  echo :: ^>^> DL_ROOT_DIR ���ݒ肳��Ă��܂���
  echo "config.cmd" ���m�F���Ă��������B�����𒆒f���܂�[err=%1]
)

if %1 equ 121 (
  echo :: ^>^> DL_ROOT_DIR �ɐݒ肳�ꂽ�ۑ��惋�[�g�t�H���_��������܂���
  echo "config.cmd" ���m�F���Ă��������B�����𒆒f���܂�[err=%1]
)


if %1 equ 210 (
  echo :: ^>^> SERVICE_NAME ���ݒ肳��Ă��܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 220 (
  echo :: ^>^> USE_LIST ���ݒ肳��Ă��܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 221 (
  echo :: ^>^>^>^> "%LIST_DIR_NAME%\korec-dl-downloadlist.xml" ��������܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���邩�A
  echo "%LIST_DIR_NAME%\korec-dl-downloadlist.xml" ���쐬���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 222 (
  echo :: ^>^>^>^> "%LIST_DIR_NAME%\%SERVICE_NAME:~1,-1%.xml" ��������܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���邩�A
  echo "%LIST_DIR_NAME%\%SERVICE_NAME:~1,-1%.xml" ���쐬���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 230 (
  echo :: ^>^> USE_FILTER ���ݒ肳��Ă��܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 231 (
  echo :: ^>^>^>^> "%FILTER_DIR_NAME%\%SERVICE_NAME:~1,-1%.xslt" ��������܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���邩�A
  echo "%FILTER_DIR_NAME%\%SERVICE_NAME:~1,-1%.xslt" ���쐬���Ă��������B�������X�L�b�v���܂�[err=%1]
)

if %1 equ 240 (
  echo :: ^>^> USE_OUTPUT_LOG ���ݒ肳��Ă��܂���
  echo "%SERVICE_DIR_NAME%\%~nx2" �̐ݒ���m�F���Ă��������B�������X�L�b�v���܂�[err=%1]
)

exit /b
