:: ���ļ�Ϊ windows ԭ��ϵͳ����֧��
:: Code Type: GBK2312
echo off
setlocal
title "[qcr] copy - windows"
@echo.

set date=%date:~0,4%%date:~5,2%%date:~8,2%
echo %0 ����������...
@echo.
echo ****************

::ʵ��������ݣ�ռ�豣��
::echo ..\\.vscode,..\\.runtime >> tmp.qcr

set sourceFile=tmp.qcr
set tmpdir=runtime

mkdir ..\\.%tmpdir%
@echo off
if exist %sourceFile% ( 
    for %%A in (%sourceFile%) do (
        if %%~zA==0 (
            echo ����ļ�����һЩ���⣡�����³��ԣ�����
            echo "[qcr][%time%](copy) > �����ļ�����ʱ�����˴������� tmp.qcr �ļ���" >> ..\\.runtime\%date%.log
        ) else (
            setlocal enabledelayedexpansion
            for /f "tokens=1-3 delims=," %%i in (%sourceFile%) do (
                set from=%%i
                set to=%%j

                echo ���� !from! �� !to!
                xcopy !from! !to! /E /H /C /I /Y
            )
        )
    )

) else (
    echo ��...�㲻Ӧ���������밲ȫ���������򿪴��ļ���~!
    echo "[qcr][%time%](copy) > �û���ͼ���������������ֹ�޲��������У�" >> ..\\.runtime\%date%.log
)
del %sourceFile%
pause
endlocal