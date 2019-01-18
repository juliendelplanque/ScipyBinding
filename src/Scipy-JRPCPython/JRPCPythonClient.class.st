Class {
	#name : #JRPCPythonClient,
	#superclass : #JRPCClient,
	#category : #'Scipy-JRPCPython'
}

{ #category : #private }
JRPCPythonClient >> createProcess [
	^ OSSUnixSubprocess new
		command: '/usr/local/bin/python3';
		arguments: {self pythonStdinStdoutRpcScriptPath pathString . '1'};
		redirectStdin;
		redirectStdout;
		yourself.
]

{ #category : #accessing }
JRPCPythonClient >> pythonStdinStdoutRpcScriptPath [
	^ (IceRepository registry detect: [ :repo | repo name = 'ScipyBinding' ]) location / 'stdin-stdout-rpc.py'
]

{ #category : #'private - sending' }
JRPCPythonClient >> sendRequest: aJRPCRequestObject [
	| process streamClient result |
	process := self createProcess.
	process run.
	streamClient := JRPCStreamClient writeStream: process stdinStream readStream: process stdoutStream requestsSeparator: Smalltalk os lineEnding.
	streamClient actionAfterStreamWritten: [ :stream |
		stream close.
		process waitForExit ].
	
	result := streamClient sendRequest: aJRPCRequestObject.
	process closeAndCleanStreams.
	^ result
]
