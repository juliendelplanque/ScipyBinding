"
I wrap a dictionary to store results of a call to scipy as an object (in Python a tuple is returned to allow multi-variables assignment but this is not possible in Pharo).
"
Class {
	#name : #ScipyCallResult,
	#superclass : #Object,
	#instVars : [
		'resultsDict'
	],
	#category : #ScipyBinding
}

{ #category : #'reflective operations' }
ScipyCallResult >> doesNotUnderstand: aMessage [
	aMessage arguments size > 1
		ifTrue: [ ^ super doesNotUnderstand: aMessage ].
		
	(aMessage arguments size = 1)
		ifTrue: [ 
			resultsDict at: aMessage selector allButLast asSymbol put: aMessage arguments first.
			^ self ].
	
	^ resultsDict
		at: aMessage selector
		ifAbsent: [ super doesNotUnderstand: aMessage ]
]

{ #category : #initialization }
ScipyCallResult >> initialize [
	super initialize.
	resultsDict := OrderedDictionary new
]

{ #category : #printing }
ScipyCallResult >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	resultsDict associations do: [ :assoc |
		aStream nextPutAll: assoc key.
		aStream nextPut: $=.
		assoc value printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]
