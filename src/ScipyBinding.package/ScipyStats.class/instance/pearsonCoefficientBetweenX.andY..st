bindings
pearsonCoefficientBetweenX: x andY: y
	| response |
	response := self callMethod: 'pearsonr' inModule: 'scipy.stats' withArguments: { x . y }.
	
	^ ScipyCallResult new
		r: response first;
		pValue: response second;
		yourself