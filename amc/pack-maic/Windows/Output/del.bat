:: ���ļ�Ϊ windows ԭ��ϵͳ����֧��
:: Code Type: GBK2312
echo off
setlocal
title "[qcr] del - windows"
@echo.

set date=%date:~0,4%%date:~5,2%%date:~8,2%
echo %0 ����������...
@echo.
echo ****************
set sourceFile=tmp.qcr
set tmpdir=runtime

mkdir ..\\.%tmpdir%
if exist %sourceFile% ( 
    for %%A in (%sourceFile%) do (
        if %%~zA==0 (
            echo ����ļ�����һЩ���⣡�����³��ԣ�����
            echo "[qcr][%time%](del) > �����ļ�����ʱ�����˴������� tmp.qcr �ļ���" >> ..\\.runtime\%date%.log
        ) else (
            setlocal enabledelayedexpansion
            for /f "tokens=1-3 delims=," %%i in (%sourceFile%) do (
                set dfx=%%i

                echo ɾ���ļ� !dfx!
                del !dfx! /Q
            )
        )
    )

) else (
    echo ��...�㲻Ӧ���������밲ȫ���������򿪴��ļ���~!
    echo "[qcr][%time%](del) > �û���ͼ���������������ֹ�޲��������У�" >> ..\\.runtime\%date%.log
)
del tmp.qcr
pause
endlocal