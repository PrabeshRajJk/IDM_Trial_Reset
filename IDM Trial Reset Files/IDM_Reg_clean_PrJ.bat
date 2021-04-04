
@ECHO ON

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"

::------------------------------------------------------------------------------------------------------------------------------------
::Process killing IDM
::------------------------------------------------------------------------------------------------------------------------------------
Echo:
taskkill /IM "IDMan.exe" /F
taskkill /IM "IEMonitor.exe" /F
taskkill /IM "IDMGrHlp.exe" /F
taskkill /IM "idmBroker.exe" /F
taskkill /IM "IDMIntegrator64.exe" /F
taskkill /IM "IDMMsgHost.exe" /F
taskkill /IM "MediumILStart.exe" /F


::------------------------------------------------------------------------------------------------------------------------------------
::Reg-entries cleaning
::------------------------------------------------------------------------------------------------------------------------------------
set "nul=1>nul 2>nul"
setlocal EnableDelayedExpansion

for %%# in (
"HKLM\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKLM\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKLM\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKLM\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKLM\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKLM\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKLM\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKLM\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKLM\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKLM\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKCU\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKCU\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKCU\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKCU\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKCU\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKCU\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKCU\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKCU\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKCU\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKU\.DEFAULT\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKU\.DEFAULT\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKU\.DEFAULT\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKU\.DEFAULT\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKU\.DEFAULT\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKU\.DEFAULT\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKU\.DEFAULT\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKU\.DEFAULT\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKU\.DEFAULT\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}"
"HKU\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}"
"HKLM\Software\Internet Download Manager"
"HKLM\Software\Wow6432Node\Internet Download Manager"
"HKLM\Software\Download Manager"
"HKLM\Software\Wow6432Node\Download Manager"
"HKLM\Software\DownloadManager"
"HKLM\Software\Wow6432Node\DownloadManager"
"HKCU\Software\Download Manager"
"HKCU\Software\Wow6432Node\Download Manager"
"HKCU\Software\Wow6432Node\DownloadManager"
"HKU\.DEFAULT\Software\Download Manager"
"HKU\.DEFAULT\Software\Wow6432Node\Download Manager"
"HKU\.DEFAULT\Software\DownloadManager"
"HKU\.DEFAULT\Software\Wow6432Node\DownloadManager"
) do for /f "tokens=* delims=" %%A in ("%%#") do (
set "reg=%%#" &CALL :DELETE
)

::------------------------------------------------------------------------------------------------------------------------------------
::Reset Rot flags
::------------------------------------------------------------------------------------------------------------------------------------

[HKEY_CLASSES_ROOT\AppID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}]
"ROTFlags"=-

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

Echo:
Echo::===================================================
Echo::
Echo::
Echo::============ IDM Trial Reset Success via Registry cleaning =======================
Echo::
Echo::
Echo::===================================================
Echo:
Echo:


