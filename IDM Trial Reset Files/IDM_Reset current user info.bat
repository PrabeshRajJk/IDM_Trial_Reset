
@ECHO ON

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"

::------------------------------------------------------------------------------------------------------------------------------------
::Reset current user info
::------------------------------------------------------------------------------------------------------------------------------------
REG DELETE "HKLM" /ve /f
REG DELETE "HKLM" /v "MData" /f
REG DELETE "HKLM" /v "Model" /f
REG DELETE "HKLM" /v "Therad" /f
REG DELETE "HKCU" /ve /f
REG DELETE "HKCU" /v "MData" /f
REG DELETE "HKCU" /v "Model" /f
REG DELETE "HKCU" /v "Therad" /f
REG DELETE "HKCU\Software\DownloadManager" /v "FName" /f
REG DELETE "HKCU\Software\DownloadManager" /v "LName" /f
REG DELETE "HKCU\Software\DownloadManager" /v "Email" /f
REG DELETE "HKCU\Software\DownloadManager" /v "Serial" /f
REG DELETE "HKCU\Software\DownloadManager" /v "CheckUpdtVM" /f
REG DELETE "HKCU\Software\DownloadManager" /v "tvfrdt" /f
REG DELETE "HKCU\Software\DownloadManager" /v "LstCheck" /f
REG DELETE "HKCU\Software\DownloadManager" /v "scansk" /f


cmd /k 

