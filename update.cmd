@echo off
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "year=%dt:~0,4%"
set "month=%dt:~4,2%"
set "day=%dt:~6,2%"
set "hour=%dt:~8,2%"
set "minute=%dt:~10,2%"
set "second=%dt:~12,2%"
set "timestamp=%year%年%month%月%day%日%hour%时%minute%分%second%秒"
git add . --all
git commit -m "update %timestamp%"
git push
