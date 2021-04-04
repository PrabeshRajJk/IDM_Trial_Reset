: Runing bat with administrative privileges 

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"

:: Taking access permission 
icacls "C:\Program Files (x86)\Internet Download Manager" /q /c /t /grant Everyone:F
:: copying the bat file to IDM Folder

copy "%~dp0/IDM Trial Reset Files\IDM_Reg_clean_PrJ_test.bat" "C:\Program Files (x86)\Internet Download Manager\"

@Echo  Adding the IDM trail reset bat file in task schedule to run it everytime the device is on

SCHTASKS /CREATE /SC ONSTART /TN "IDM\IDM Trial Reset" /TR "C:\Program Files (x86)\Internet Download Manager\IDM_Reg_clean_PrJ.bat" 

: wait for user approve
@ Echo  !!!! WARNING !!!!
@ Echo IDM will exit and any ongoing download will be stopped
@ Echo If any ongoing download in IDM wait till it complete

@pause 

: Running bat file to clean registry
CALL "C:\Program Files (x86)\Internet Download Manager\IDM_Reg_clean_PrJ.bat"

:exiting  
EXIT
