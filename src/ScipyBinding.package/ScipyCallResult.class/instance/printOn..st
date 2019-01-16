printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	resultsDict associations do: [ :assoc |
		aStream nextPutAll: assoc key.
		aStream nextPut: $=.
		assoc value printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)