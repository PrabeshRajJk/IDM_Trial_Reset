
@ECHO ON

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"


SET NEWLINE=^& echo.


ECHO %NEWLINE%^	>>%WINDIR%\system32\drivers\etc\hosts

ECHO %NEWLINE%^	>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "#internetdownloadmanager" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^#internetdownloadmanager>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "tonec.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	tonec.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "www.tonec.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	www.tonec.com>>%WINDIR%\system32\drivers\etc\hosts

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	registeridm.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "registeridm.com" %WINDIR%\system32\drivers\etc\hosts

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	www.registeridm.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "www.registeridm.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	secure.registeridm.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "secure.registeridm.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	www.internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "www.internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	secure.internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "secure.internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	mirror.internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "mirror.internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	mirror2.internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts 
FIND /C /I "mirror2.internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts 

IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^	127.0.0.1	mirror3.internetdownloadmanager.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "mirror3.internetdownloadmanager.com" %WINDIR%\system32\drivers\etc\hosts
Pause

cmd /k 
EXIT
