component {

	/* Application Settings */
	this.name = 'Scheduled Task App';
	this.datasource = 'ScheduledTasks';
	this.applicationtimeout = createTimespan(0, 3, 0, 0);
	this.sessiontimeout = createTimespan(0, 0, 30, 0);
	this.sessionmanagement = true;
	this.loginstorage = "session";

	/* ORM settings */
	this.ormenabled = true;
	this.ormsettings.dbcreate = 'update';
	this.ormsettings.flushAtRequestEnd = false;
	this.ormsettings.autoManageSession= false;
	this.ormSettings.secondaryCacheEnabled = true;


	function onApplicationStart()
	{
		/* Basic Application settings*/
		application.name = this.name;
		application.initialized = now();

		/* Basic Error Settings */
		application.error.type = ['console','screen'];
		application.error.name = this.name;
		application.error.console.server = 'http://192.168.11.200/endpoint';
		application.error.console.port = '8090';

		/* empty translations */
		structDelete( application, 'translations' );
	}

	function onSessionStart()
	{
		/* Translation settings */
		session.locale = 'NL';
	}

	function onRequestStart()
	{
		if ( structKeyExists( url, 'reset' ) )
		{
			this.onApplicationStart();
			this.onSessionStart();
			ormReload();
		}
		request.tick = createObject("java","java.lang.System").nanoTime();

	}

	function onRequestEnd()
	{
		this.processTime(request.tick);
	}

	function onError( required exception, required string eventname )
	{
		try {
			var objError = createObject( 'component', 'tools.error.report' );
			objError.report( arguments.exception );
		} catch ( any e ) {
			writeDump( e );
			throw( argumentCollection: arguments.exception );
		}
	}


	private void function processTime( required number tick )
	{
		var endTime = createObject("java","java.lang.System").nanoTime();
		var processTime = ( endTime - arguments.tick ) / 1000000;

		writeDump( processTime );
		writeoutput("<!--- Processing time: #processTime# ms --->");
	}

	private void function processUrl( required string uri )
	{
		var uri = arguments.uri;
		var secList = '';

		if ( uri eq '/' )
		{
			uri = '/index';
		}

		var uriLen = listLen( uri, '/' );
		switch ( uriLen )
		{
			case 4:
				secList = "sector,section,subsection,file";
				break;
			case 3:
				secList = "sector,section,file";
				break;
			case 2:
				secList = "sector,file";
				break;
			case 1:
				secList = "file";
				break;
			default:
				writeOutput("Your url is malformed");
					abort;
		}




	}

}















