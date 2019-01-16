accessing
pythonStdinStdoutRpcScriptPath
	^ (IceRepository registry detect: [ :repo | repo name = 'ScipyBinding' ]) location / 'stdin-stdout-rpc.py'