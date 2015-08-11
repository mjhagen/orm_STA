component {

	public void function error_console( required string error )
	{
		var httpArgs = {
			method: 'POST',
			url: application.error.console.server,
			port: application.error.console.port
		};
		var httpCall = new http( argumentCollection: httpArgs );
		httpCall.addParam(
			type: 'formfield',
			name: 'app',
			value: application.name

		);
		httpCall.addParam(
			type: 'formfield',
			name: 'time',
			value: lsTimeFormat( now(), 'HH:MM' )

		);
		httpCall.addParam(
			type: 'formfield',
			name: 'error',
			value: arguments.error

		);

		// httpCall.send();
	}

}