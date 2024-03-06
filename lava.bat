@echo off
setlocal enabledelayedexpansion

REM 设置循环次数
set "loop_count=10000"

REM 循环执行 curl 命令
for /l %%i in (1,1,%loop_count%) do (
    for /f "usebackq tokens=1 delims=," %%a in ("wallet.csv") do (
        set "address=%%a"
        echo Execution for address !address!:
        curl -k -X POST -H "Content-Type: application/json" --data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"!address!\", \"latest\"],\"id\":1}" https://eth1.lava.build/lava-referer-6b95e5ca-087c-4c37-931c-8cd1c3853cc7/
        echo.
    )
)

endlocal
