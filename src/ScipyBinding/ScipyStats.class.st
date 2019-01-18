Class {
	#name : #ScipyStats,
	#superclass : #Object,
	#traits : 'TPythonFunctionRunner',
	#classTraits : 'TPythonFunctionRunner classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #ScipyBinding
}

{ #category : #accessing }
ScipyStats class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew ]
]

{ #category : #bindings }
ScipyStats >> linearRegressionWithX: x y: y [
	| response |
	response := self callMethod: 'linregress' inModule: 'scipy.stats' withArguments: { x . y }.
	
	^ ScipyCallResult new
		slope: response first;
		intercept: response second;
		rvalue: response third;
		pvalue: response fourth;
		stderr: response fifth;
		yourself
]

{ #category : #bindings }
ScipyStats >> pearsonCoefficientBetweenX: x andY: y [
	| response |
	response := self callMethod: 'pearsonr' inModule: 'scipy.stats' withArguments: { x . y }.
	
	^ ScipyCallResult new
		r: response first;
		pValue: response second;
		yourself
]
