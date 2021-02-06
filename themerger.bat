@echo off
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 ECHO Unable to enable extensions
if not defined location (echo location is not define! redifine it and come back!
Exit /b)


if not exist "%videospath%%location%1.ts" (echo hahahaha first video is not in here----%videospath%
Exit /b)

if not exist "%videospath%%location%2.ts" (echo hahahaha 2nd video is not in here----%videospath%
Exit /b)


REM  MERGING THE TWO FILES


ffmpeg -report -protocol_whitelist "file,http,https,tcp,tls,crypto,data,concat"  -i "concat:%videospath%%location%1.ts|%videospath%%location%2.ts"  -c copy "%videospath%%location%.ts"


REM if above is successful
REM delete %videospath%%location%1.ts AND %videospath%%location%2.ts

