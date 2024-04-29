@echo off
::Criado por; Rodrigo Albuquerque
::Backup de Arquivos Windows v1.2
mode con: lines=30 cols=65
color 1f
title Backup Windows v1.2
::Adicione sua unidade de backup caso não esteja aqui
set uni=a: b: c: d: e: f: g: h: i: j:
::Inicio do Script
:retorno
call artASCII\art.bat
echo.
set /p "unidade=-Digite a unidade para Backup, exemplo> g: "
::Laço For para comparação... 
for %%a in (%uni%) do ( if /i %unidade%== %%a goto inicio)
::Caso a unidade esteja errada retorna!!!
  echo.
  echo -Unidade errada ou ausente, tente novamente!!!
  pause> nul
  cls
  goto retorno
::Opções de Backup
:inicio
cls
echo.
call artASCII\art2.bat 
echo.
::Choice + errorlevel
choice /c "12345678" /n /m "-Digite>"
  goto %errorlevel%
:1 
xcopy %userprofile%\Desktop\*.* /exclude:removelnk.txt %unidade% /s /e /y    
  goto inicio
:2
xcopy %userprofile%\Pictures\*.* %unidade% /s /e /y
  goto inicio
:3
xcopy %userprofile%\Videos\*.* %unidade% /s /e /y
  goto inicio 
:4
xcopy %userprofile%\Documents\*.* %unidade% /s /e /y
  goto inicio
:5
xcopy %userprofile%\Music\*.* %unidade% /s /e /y
  goto inicio
:6
xcopy %userprofile%\Downloads\*.* %unidade% /s /e /y
  goto inicio
:7
  cls
  goto retorno
:8
  exit
pause >nul
