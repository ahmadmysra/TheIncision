@echo off

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 ECHO Unable to enable extensions
set videospath=somehting:\then\something
if not defined location (echo location is not define! redifine it and come back!
Exit \b)

if not exist "%videospath%\%location%.ts" (echo hahahaha first video is not in here----%videospath%\
Exit /b)

if exist "%videospath%\%location%1.ts" (echo hahahaha first video is already here----%videospath%\
Exit /b)

if exist "%videospath%\%location%2.ts" (echo hahahaha first video is already here----%videospath%\
Exit /b)


ren "%videospath%\%location%.ts" %location%1.ts

REM /////////////////////////////////////////////////////////////////////////////
::::: ---- defining the assign macro ---- ::::::::
REM /////////////////////////////////////////////////////////////////////////////


setlocal DisableDelayedExpansion
(set LF=^
%=EMPTY=%
)
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

::set argv=Empty
set assign=for /L %%n in (1 1 2) do ( %\n%
   if %%n==2 (%\n%
      setlocal enableDelayedExpansion%\n%
      for /F "tokens=1,2 delims=," %%A in ("!argv!") do (%\n%
         for /f "tokens=* delims=" %%# in ('%%~A') do endlocal^&set "%%~B=%%#" %\n%
      ) %\n%
   ) %\n%
) ^& set argv=,

::::: -------- ::::::::
:::EXAMPLE
%assign% "ffprobe  -i "%videospath%\%location%1.ts" -show_entries format=duration -v quiet -of csv="p=0"",video1Duration
set /A secondsToDeduct=11
set /A video1Duration=video1Duration
set /A finalDuration=%video1Duration%-%secondsToDeduct%
echo %video1Duration%
echo %secondsToDeduct%
echo %finalDuration%



REM  GETTING DURATION OF FIRST VIDEO AND DOWNLOADING THE REST //NEEDS THE MACRO ABOVE//


ffmpeg -report -user_agent "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36" -protocol_whitelist "file,http,https,tcp,tls,crypto,data" -allowed_extensions ALL -ss %finalDuration% -i "http://link/to/m3u8/%location%.m3u8" -c copy "%videospath%\%location%2.ts"

REM /////////////////////////////////////////////////////////////////////////////////////

