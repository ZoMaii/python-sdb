:: ���ļ�Ϊ windows ԭ��ϵͳ����֧��
:: Code Type: GBK2312
echo off
setlocal
title "[qcr] move - windows"
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
            echo "[qcr][%time%](move) > �����ļ�����ʱ�����˴������� tmp.qcr �ļ���" >> ..\\.runtime\%date%.log
        ) else (
            setlocal enabledelayedexpansion
            for /f "tokens=1-3 delims=," %%i in (%sourceFile%) do (
                set from=%%i
                set to=%%j

                echo �ƶ���Դ !from! �� !to!
                move !from! !to! 
            )
        )
    )

) else (
    echo ��...�㲻Ӧ���������밲ȫ���������򿪴��ļ���~!
    echo "[qcr][%time%](move) > �û���ͼ���������������ֹ�޲��������У�" >> ..\\.runtime\%date%.log
)
del tmp.qcr
pause
endlocal