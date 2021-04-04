: Runing bat with administrative privileges 
@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

: copying the bat file to IDM Folder
Robocopy "%~dp0/IDM Trial Reset Files/IDM_Reg_clean_PrJ.bat" "C:\Program Files (x86)\Internet Download Manager"

: Adding the IDM trail reset bat file in task schedule to run it everytime the device is on

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
