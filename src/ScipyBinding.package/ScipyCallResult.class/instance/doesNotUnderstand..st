reflective operations
doesNotUnderstand: aMessage
	aMessage arguments size > 1
		ifTrue: [ ^ super doesNotUnderstand: aMessage ].
		
	(aMessage arguments size = 1)
		ifTrue: [ 
			resultsDict at: aMessage selector allButLast asSymbol put: aMessage arguments first.
			^ self ].
	
	^ resultsDict
		at: aMessage selector
		ifAbsent: [ super doesNotUnderstand: aMessage ]