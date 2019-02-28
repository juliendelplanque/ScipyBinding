Extension { #name : #Collection }

{ #category : #'*ScipyBinding' }
Collection >> scipyLinearRegression [
	^ self scipyLinearRegressionWithXBlock: #x yBlock: #y
]

{ #category : #'*ScipyBinding' }
Collection >> scipyLinearRegressionWithXBlock: xBlock yBlock: yBlock [
	^ ScipyStats uniqueInstance
		linearRegressionWithX: (self collect: xBlock as: Array) y: (self collect: yBlock as: Array)
]
