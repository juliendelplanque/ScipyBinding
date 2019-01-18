Trait {
	#name : #TPythonFunctionRunner,
	#category : #ScipyBinding
}

{ #category : #calling }
TPythonFunctionRunner >> callMethod: method inModule: moduleName withArguments: args [
	| response |
	response := JRPCPythonClient new
						callMethod: 'run_function'
						arguments: #('scipy.stats' 'linregress' #((1 2 3) (4 5 6)))
						withId: 1.
	^ response result
]
