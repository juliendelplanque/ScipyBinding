Class {
	#name : #BaselineOfScipyBinding,
	#superclass : #BaselineOf,
	#category : #BaselineOfScipyBinding
}

{ #category : #baselines }
BaselineOfScipyBinding >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Packages"
			spec
				package: 'Scipy-JRPCPython' with: [ spec requires: #('JRPC' 'OSSubprocess') ];
				package: 'ScipyBinding' with: [ spec requires: #('Scipy-JRPCPython') ].
			spec
    			baseline: 'JRPC'
    			with: [ spec repository: 'github://JulienDelplanque/JRPC/src' ].
			spec baseline: 'OSSubprocess'
				with: [ spec repository: 'github://pharo-contributions/OSSubprocess/repository' ] ]
]
