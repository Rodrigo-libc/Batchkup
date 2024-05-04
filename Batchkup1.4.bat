@echo off
setlocal enabledelayedexpansion
REM Criado por: Rodrigo Albuquerque
REM Batchkup v1.4
mode con: lines=36 cols=75
color 1f
title Batchkup v1.4

REM Início
REM Adicione sua unidade aqui, caso não esteja.
	set uni=B: C: D: E: F: G: H: 

:retorno
	call "%~dp0artASCII\art.bat"
	echo.             
	echo Listando Unidades... 
	echo.   
	wmic logicaldisk where drivetype=2 get deviceid, volumename, description
	wmic logicaldisk where drivetype=3 get deviceid, volumename, description
	echo.
	echo Exemplos de unidades (g: G:) 
	echo.
	set /p "unidade=-Digite a unidade para Backup> "

	if "%unidade%"=="" (
		echo.
		echo Error, Por favor insira uma unidade valida!
		echo.
		echo Enter para continuar...
		pause >nul
		cls
		goto :retorno
	) 

		REM Laço For para comparação... 
	for %%a in (%uni%) do ( 
		if /i %unidade%== %%a goto :MenuPrincipal
	) 
		REM Caso a unidade esteja errada retorna!!!
		echo.
		echo Error, Ensira um valor valido e tente novamente!
		echo.
		echo Enter para continuar...
		pause>nul
		cls
		goto :retorno
	
:MenuPrincipal
	call "%~dp0artASCII\art2.bat"

    set /p escolha="-Digite o numero desejado: Enter para confirmar> " 
    if "%escolha%"=="1" goto :MenuDesktop
    if "%escolha%"=="2" goto :MenuDocuments
    if "%escolha%"=="3" goto :MenuPictures
    if "%escolha%"=="4" goto :MenuVideos
    if "%escolha%"=="5" goto :MenuMusicas
	if "%escolha%"=="6" goto :retorno
	
	if "%escolha%"=="" (
		echo Por favor, digite um numero de 1 a 5! 
		echo Tente novamente!
		pause >nul
		goto :MenuPrincipal
	) else (
	
		echo Error! 
		echo Entrada invalida, tente novamente!
		pause >nul
		
		goto :MenuPrincipal
	)
    
REM Menu Desktop
:MenuDesktop
	call "%~dp0artASCII\art3.bat"

    choice /c 123 /n /m "Digite> "
    if errorlevel 3 goto :MenuPrincipal
    if errorlevel 2 goto :DesktopEspec
    if errorlevel 1 goto :DesktopMassa

:DesktopMassa
    xcopy "%userprofile%\Desktop\*.*" /exclude:RemoveExtensions.txt "%unidade%" /s /e /y
    cls 
    echo.
    goto :MenuDesktop

:DesktopEspec
	cls
	cd %userprofile%\Desktop\
	dir
	echo.
REM Reseta a variável ao retornar.
	set "ArqPast="
	echo (TAB^>^>) AutoComplete (ENTER) Retorna
REM Entrada de dados.
	set /p "ArqPast=-Digite o nome da pasta ou arquivo a ser copiado..."
	if "!ArqPast!"=="" (
    goto :MenuDesktop
	) else ( 

	if not exist "%unidade%\!ArqPast!" (
		REM remove aspas duplas da pasta ou arquivo, caso tenha.
		set "ArqPast=!ArqPast:"=!" 
		xcopy "!ArqPast!" "%unidade%\!ArqPast!" /s /e /y
		echo -Enter para retornar...
		pause >nul 
		goto :MenuDesktop
		
	) else (
		echo -Arquivo ou pasta ja copiados.
		echo -Digite outro arquivo ou pasta...
		echo -Enter para retornar...
		pause >nul
		goto :MenuDesktop
	)
)

    
REM Menu Documentos    
:MenuDocuments
	call "%~dp0artASCII\art3.bat"
    
    choice /c 123 /n /m "Digite> "
    if errorlevel 3 goto :MenuPrincipal
    if errorlevel 2 goto :DocEspec
    if errorlevel 1 goto :DocMassa

:DocMassa
    xcopy "%userprofile%\Documents\*.*" "%unidade%" /s /e /y
    cls 
    echo.
    goto :MenuDocuments

:DocEspec
	cls
	cd %userprofile%\Documents\
	dir
	echo.
REM Reseta a variável ao retornar.
	set "ArqPast="
	echo (TAB^>^>) AutoComplete (ENTER) Retorna
REM Entrada de dados.
	set /p "ArqPast=-Digite o nome da pasta ou arquivo a ser copiado..."
	if "!ArqPast!"=="" (
    goto :MenuDocuments
	) else ( 

	if not exist "%unidade%\!ArqPast!" (
REM remove aspas duplas da pasta ou arquivo, caso tenha.
		set "ArqPast=!ArqPast:"=!" 
		xcopy "!ArqPast!" "%unidade%\!ArqPast!" /s /e /y
		echo -Enter para retornar...
		pause >nul 
		goto :MenuDocuments
		
	) else (
		echo -Arquivo ou pasta ja copiados.
		echo -Digite outro arquivo ou pasta...
		echo -Enter para retornar...
		pause >nul
		goto :MenuDocuments
	)
)


REM Menu Fotos        
:MenuPictures
	call "%~dp0artASCII\art3.bat"
    
    choice /c 123 /n /m "Digite> "
    if errorlevel 3 goto :MenuPrincipal
    if errorlevel 2 goto :PicturesEspec
    if errorlevel 1 goto :PicturesMassa

:PicturesMassa
    xcopy "%userprofile%\Pictures\*.*" "%unidade%" /s /e /y
    cls 
    echo.
    goto :MenuPictures

:PicturesEspec
	cls
	cd %userprofile%\Pictures\
	dir
	echo.
REM Reseta a variável ao retornar.
	set "ArqPast="
	echo (TAB^>^>) AutoComplete (ENTER) Retorna
REM Entrada de dados.
	set /p "ArqPast=-Digite o nome da pasta ou arquivo a ser copiado..."
	if "!ArqPast!"=="" (
    goto :MenuPictures
	) else ( 

	if not exist "%unidade%\!ArqPast!" (
		REM remove aspas duplas da pasta ou arquivo, caso tenha.
		set "ArqPast=!ArqPast:"=!" 
		xcopy "!ArqPast!" "%unidade%\!ArqPast!" /s /e /y
		echo -Enter para retornar...
		pause >nul 
		goto :MenuPictures
		
	) else (
		echo -Arquivo ou pasta ja copiados.
		echo -Digite outro arquivo ou pasta...
		echo -Enter para retornar...
		pause >nul
		goto :MenuPictures
	)
)

    
REM Menu Videos    
:MenuVideos    
	call "%~dp0artASCII\art3.bat"    
    
    choice /c 123 /n /m "Digite> "
    if errorlevel 3 goto :MenuPrincipal
    if errorlevel 2 goto :VideosEspec
    if errorlevel 1 goto :VideosMassa
    
:VideosMassa
    xcopy "%userprofile%\Videos\*.*" "%unidade%" /s /e /y
    cls 
    echo.
    goto :MenuVideos

:VideosEspec
	cls
	cd %userprofile%\Videos\
	dir
	echo.
REM Reseta a variável ao retornar.
	set "ArqPast="
	echo (TAB^>^>) AutoComplete (ENTER) Retorna
REM Entrada de dados.
	set /p "ArqPast=-Digite o nome da pasta ou arquivo a ser copiado..."
	if "!ArqPast!"=="" (
    goto :MenuVideos
	) else ( 

	if not exist "%unidade%\!ArqPast!" (
		REM remove aspas duplas da pasta ou arquivo, caso tenha.
		set "ArqPast=!ArqPast:"=!" 
		xcopy "!ArqPast!" "%unidade%\!ArqPast!" /s /e /y
		echo -Enter para retornar...
		pause >nul 
		goto :MenuVideos
		
	) else (
		echo -Arquivo ou pasta ja copiados.
		echo -Digite outro arquivo ou pasta...
		echo -Enter para retornar...
		pause >nul
		goto :MenuVideos
	)
)
	
    
REM Menu Músicas    
:MenuMusicas
	call "%~dp0artASCII\art3.bat"    
    
    choice /c 123 /n /m "Digite> "
    if errorlevel 3 goto :MenuPrincipal
    if errorlevel 2 goto :MusicasEspec
    if errorlevel 1 goto :MusicasMassa
    
:MusicasMassa
    xcopy "%userprofile%\Music\*.*" "%unidade%" /s /e /y
    cls 
    echo.
    goto :MenuMusicas

:MusicasEspec
	cls
	cd %userprofile%\Music\
	dir
	echo.
REM Reseta a variável ao retornar.
	set "ArqPast="
	echo (TAB^>^>) AutoComplete (ENTER) Retorna
REM Entrada de dados.
	set /p "ArqPast=-Digite o nome da pasta ou arquivo a ser copiado..."
	if "!ArqPast!"=="" (
    goto :MenuMusicas
	) else ( 

	if not exist "%unidade%\!ArqPast!" (
		REM remove aspas duplas da pasta ou arquivo, caso tenha.
		set "ArqPast=!ArqPast:"=!" 
		xcopy "!ArqPast!" "%unidade%\!ArqPast!" /s /e /y
		echo -Enter para retornar...
		pause >nul 
		goto :MenuMusicas
		
	) else (
		echo -Arquivo ou pasta ja copiados.
		echo -Digite outro arquivo ou pasta...
		echo -Enter para retornar...
		pause >nul
		goto :MenuMusicas
	)
)

pause >nul
