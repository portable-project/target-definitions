@echo off
setlocal EnableDelayedExpansion
IF "%~1" neq "" (
	set Portable.RemoteTasks.Manager.Login=ppw_arm
	set Portable.RemoteTasks.Manager.Password=C7D218A0
	set defFile=C:\Users\Home\Desktop\study\practise\arm11.target.pdsl
	set archName=ARM1136JF
	set asmListing=test.asm
	echo %Portable.RemoteTasks.Manager.Login%
	;echo %Portable.RemoteTasks.Manager.Password%
	echo !archName!

	IF "%~1" == "ass" (
		Portable.RemoteTasks.Manager.exe -w -id -s AssembleRaw asmListing !asmListing! definitionFile !defFile! archName !archName! > util\tmp.txt
		for /F %%i in (util\tmp.txt) do set id=%%i
		echo TaskID: !id!

		echo. 
		echo RESULTS:
		Portable.RemoteTasks.Manager.exe -g !id!
		Portable.RemoteTasks.Manager.exe -g !id! -r raw.out.bin > util\assfile.bin
	
		echo. 
		echo out file been writen in util\assfie.bin

		exit /b
	)

	IF "%~1" == "diss" (
		Portable.RemoteTasks.Manager.exe -w -id -s DisassembleRaw raw.in.bin util\assfile.bin definitionFile !defFile! archName !archName! > util\tmp.txt
		
		for /F %%i in (util\tmp.txt) do set id=%%i
		echo TaskID: %id% 
		echo. 
		echo RESULTS:
		Portable.RemoteTasks.Manager.exe -g !id!
		Portable.RemoteTasks.Manager.exe -g !id! -r disasmListing.txt  > util\dissfile.asm		
		
		echo. 

		echo + opcodes in util\dissfile.asm

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