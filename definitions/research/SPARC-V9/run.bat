@echo off

setlocal EnableDelayedExpansion

IF "%~1" neq "" (
	:: Параметры
	set Portable.RemoteTasks.Manager.Login=ppw_sparc
	set Portable.RemoteTasks.Manager.Password=A6ACC8B8
	set defFile=sparc-v9.pdsl
	set archName=SPARC-V9
	set asmListing=program.asm

	:: Вывод информации об используемом аккаунте
	echo.
	echo Login:        %Portable.RemoteTasks.Manager.Login%
	echo Password:     %Portable.RemoteTasks.Manager.Password%

	:: Вывод информации о параметрах
	echo.
	echo Architecture: !archName!
	echo PDSL file:    !defFile!
	echo ASM listing:  !asmListing!
	echo.

	:: Валидировать
	IF "%~1" == "validate" (
		Portable.RemoteTasks.Manager.exe -w -id -s VisualizeArchModel definitionFile !defFile! archName !archName! > util\tmp.txt
		
		for /F %%i in (util\tmp.txt) do set id=%%i
		echo TaskID: !id!
		echo. 
		echo RESULTS:
		Portable.RemoteTasks.Manager.exe -g !id!
		Portable.RemoteTasks.Manager.exe -g !id! -r syntaxTree.txt > util\syntaxTree
		Portable.RemoteTasks.Manager.exe -g !id! -r archInfoGraph.dgml > util\graphFile.dgml
		echo. 
		echo + syntaxTree and graph in util\

		exit /b
	)

	:: Ассемблировать
	IF "%~1" == "asm" (
		Portable.RemoteTasks.Manager.exe -w -id -s Assemble asmListing !asmListing! definitionFile !defFile! archName !archName! > util\tmp.txt
		for /F %%i in (util\tmp.txt) do set id=%%i
		echo TaskID: !id!

		echo. 
		echo RESULTS:
		Portable.RemoteTasks.Manager.exe -g !id!
		Portable.RemoteTasks.Manager.exe -g !id! -r out.ptptb > util\asmfile
		echo. 
		echo out file been writen in util\outfile

		exit /b
	)

	:: Дизассемблировать
	IF "%~1" == "diss" (
		Portable.RemoteTasks.Manager.exe -w -id -s Disassemble in.ptptb util\asmfile definitionFile !defFile! archName !archName! > util\tmp.txt
		
		for /F %%i in (util\tmp.txt) do set id=%%i
		echo TaskID: %id% 
		echo. 
		echo RESULTS:
		Portable.RemoteTasks.Manager.exe -g !id!
		Portable.RemoteTasks.Manager.exe -g !id! -r disasmListing.txt  > util\dissfile		
		for /F %%a in (util\outfile) do echo %%a
		echo. 

		echo + opcodes in util\dissfile

		exit /b
	)

) else (echo No argument passed)