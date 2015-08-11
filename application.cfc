component {
	this.name = 'Scheduled Task App';

	this.datasource = 'ScheduledTasks';

	this.ormenabled = true;
	this.ormsettings.dbcreate = 'update';
	this.ormsettings.flushAtRequestEnd = false;
	this.ormsettings.autoManageSession= false;
	this.ormSettings.secondaryCacheEnabled = true;

	/* Error Logging Settings */

	function onRequestStart()
	{
		request.startTick = getTickCount();
		application.name = this.name;
		application.error.console.server = 'http://192.168.11.200/endpoint';
		application.error.console.port = '8090';
		session.locale = 'NL';
	}

	function onRequestEnd()
	{
		variables.timeUsed = getTickCount() - request.startTick;
		writeDump(variables.timeUsed);
	}



}