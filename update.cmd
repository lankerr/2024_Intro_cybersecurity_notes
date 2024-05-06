@echo off
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "timestamp=%dt:~0,4%%dt:~4,2%%dt:~6,2%%dt:~8,2%%dt:~10,2%%dt:~12,2%"
git add . --all
git commit -m "update %timestamp%"
git push
