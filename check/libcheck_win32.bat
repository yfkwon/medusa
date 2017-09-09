@echo off
if "%1" == "" goto usage
if not "%2" == "" goto usage

dumpbin /symbols %1 | findstr /c:"nconf_"
goto end

:usage
echo Usage:
echo libcheck_win32.bat {lib_name}

:end