Trait {
	#name : #TPythonFunctionRunner,
	#category : #ScipyBinding
}

{ #category : #calling }
TPythonFunctionRunner >> callMethod: method inModule: moduleName withArguments: args [
	| response |
	response := JRPCPythonClient new
						callMethod: 'run_function'
						arguments: {'scipy.stats' . 'linregress' . args }
						withId: 1.
	^ response result
]
