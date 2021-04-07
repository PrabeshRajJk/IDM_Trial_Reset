@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
::    <wirte YOUR BATCH SCRIPT BELOW HERE>

@Echo copying the bat file to C:\IDM_Trial Reset
Robocopy "%~dp0\IDM Trial Reset Files" "C:\IDM_Trial Reset" "IDM_Reg_clean__Trial Reset.bat"
Robocopy "%~dp0\IDM Trial Reset Files" "C:\IDM_Trial Reset" "IDM TRIAL RESET_ Task Schedule.xml"
:: trial reset Task Schedule

::  Taking Administrators group full control permission to the C:\WINDOWS\Tasks folder
cd /d C:/windows
CACLS TASKS /E /G builtin\administrators:F

@Echo  Adding the IDM trail reset bat file in task schedule to run it everytime the device is started

:: SCHTASKS /CREATE /SC ONSTART /TN "IDM Trial Reset\IDM Trial Reset" /TR "C:\IDM_Trial Reset\IDM_Reg_clean__Trial Reset.bat" 
SCHTASKS /create /xml "C:\IDM_Trial Reset\IDM TRIAL RESET_ Task Schedule.xml" /tn "\IDM Trial Reset\IDM TRIAL RESET_ Task Schedule_ Run Daily"

control schedtasks
@Echo check the IDM folder in task schedule
# Echo if not present
@Echo IMPORT  IDM TRIAL RESET_ Task Schedule.xml  
@Echo from "C:\IDM_Trial Reset"

@pause 
Explorer "C:\IDM_Trial Reset"
:: wait for user approve

@ Echo  !!!! WARNING !!!!
@ Echo IDM will exit and any ongoing download will be stopped
@ Echo If any ongoing download in IDM wait till it complete
@Echo Off
Set "#="
Set /P "=Press C to continue :"<Nul
For /F Skip^=1^ Delims^=^ EOL^= %%$ In ('Replace ? . /U /W') Do If Not Defined # Set "#=%%$"
Echo(
If /I Not "%#%"=="C" Exit /B
Rem Your code goes here
:: Running bat file to clean registry
CALL "C:\IDM_Trial Reset\IDM_Reg_clean__Trial Reset.bat"

:exiting  
EXIT
