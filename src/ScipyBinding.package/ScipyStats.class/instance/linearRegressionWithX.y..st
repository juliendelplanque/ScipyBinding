bindings
linearRegressionWithX: x y: y
	| response |
	response := self callMethod: 'linregress' inModule: 'scipy.stats' withArguments: { x . y }.
	
	^ ScipyCallResult new
		slope: response first;
		intercept: response second;
		rvalue: response third;
		pvalue: response fourth;
		stderr: response fifth;
		yourself