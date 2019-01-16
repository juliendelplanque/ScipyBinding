private
createProcess
	^ OSSUnixSubprocess new
		command: '/usr/local/bin/python3';
		arguments: {self pythonStdinStdoutRpcScriptPath pathString . '1'};
		redirectStdin;
		redirectStdout;
		yourself.