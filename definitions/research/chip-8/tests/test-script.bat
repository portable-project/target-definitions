@echo off
setlocal EnableDelayedExpansion
IF "%~1" neq "" (
	set Portable.RemoteTasks.Manager.Login=ppw_chip8
	set Portable.RemoteTasks.Manager.Password=AD5D4F439AEC
	set defFile=../DEFINITIONS.target.pdsl
	set archName=chip8
	set asmListing=pong.asm
	echo.%Portable.RemoteTasks.Manager.Login%
	echo.%Portable.RemoteTasks.Manager.Password%
	echo.!archName!

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

	IF "%~1" == "valid" (
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

	echo invalid argument
	

) else ( echo gimmie arguments)