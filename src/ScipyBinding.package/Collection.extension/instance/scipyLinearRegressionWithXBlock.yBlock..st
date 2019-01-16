*ScipyBinding
scipyLinearRegressionWithXBlock: xBlock yBlock: yBlock
	^ ScipyStats uniqueInstance
		linearRegressionWithX: (self collect: xBlock) y: (self collect: yBlock)