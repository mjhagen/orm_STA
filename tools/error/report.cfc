component extends='tools.functions' {

	public void function report( required struct error )
	{
		if ( !structKeyExists( application.error, 'type' ) || !isArray( application.error.type )  )
		{
			application.error.type = ['screen'];
		}

		for ( var element in application.error.type )
		{
			this[ 'error_' & element ]( arguments.error );
		}
	}

	public void function error_console( required struct error )
	{
		var settings = structKeyExists( application.error, 'console' ) ? application.error.console : {};

		var error = structKeyExists( arguments.error, 'special' ) ? arguments.error.special : arguments.error.message;

		settings.port = structKeyExists( settings, 'port' ) ? settings.port : 80;

		if ( !structKeyExists( settings, 'server' ) )
		{
			this.error_screen( 'Error Logging: console settings not defined (server)' );
		} else {

			var httpArgs = {
				method: 'POST',
				url: settings.server,
				port: settings.port
			};

			var httpParams = [
				{
					type: 'formfield',
					name: 'app',
					value: application.error.name
				},
							{
					type: 'formfield',
					name: 'time',
					value: lsTimeFormat( now(), 'HH:MM' )
				},
				{
					type: 'formfield',
					name: 'error',
					value: error
				},
				{
					type: 'formfield',
					name: 'stacktrace',
					value: serializeJSON( arguments.error.stacktrace )
				},
				{
					type: 'formfield',
					name: 'tagContext',
					value: serializeJSON( arguments.error.tagContext )
				}
			]

			var httpCall = new http( argumentCollection: httpArgs );

			this.http_addparams( httpCall, httpParams );

			// httpCall.send();
		}

	}

	private void function error_screen( required struct error )
	{
		throw( argumentCollection: arguments.error );
	}

}