private - sending
sendRequest: aJRPCRequestObject
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