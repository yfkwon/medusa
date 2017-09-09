@echo off
setlocal enabledelayedexpansion
if exist version.cpp del version.cpp

set today=%date:~6,4%%date:~0,2%%date:~3,2%
set hour=%time:~0,2%

if "%hour:~0,1%" == " " set hour=0%hour:~1,1%

set ver=%today%_%hour%

for /f "tokens=*" %%a in (version.cpp.template) do (
  set var=%%a
  set var=!var:#MIRACLE_VER#=%ver%!
  echo !var! >> version.cpp
)
endlocal