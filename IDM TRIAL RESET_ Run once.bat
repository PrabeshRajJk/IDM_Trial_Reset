****************************************** CURRENT ISSUES ******************************************
:: 
:: ISSUES :: SCHTASKS   can not make the schedule task in some users
:: Solution :: as per now 
:: use    control schedtasks   to open the task schedule and import the .xml file 
:: 
:: 
:: 
:: ISSUES :: IDM x86 folder  can not  be accesses while using robocopy or x copy
:: Solution :: as per now 
:: use    any other folder  C:\
:: 
:: Runing bat with administrative privileges 
:: ****************************************** Script begins from here ******************************************

:: Runing with administrative privileges 

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
cls

:: copying the bat file to IDM Folder
Robocopy "%~dp0\IDM Trial Reset Files" "C:\IDM_Trial Reset" "IDM_Reg_clean__Trial Reset.bat"
Robocopy "%~dp0\IDM Trial Reset Files" "C:\IDM_Trial Reset" "IDM TRIAL RESET_ Task Schedule.xml"
:: trial reset Task Schedule
@Echo  Adding the IDM trail reset bat file in task schedule to run it everytime the device is started

SCHTASKS /CREATE /SC ONSTART /TN "IDM\IDM Trial Reset" /TR "C:\IDM_Trial Reset\IDM_Reg_clean__Trial Reset.bat" 

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
