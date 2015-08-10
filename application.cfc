component {
	this.name = 'Scheduled Task App';

	this.datasource = 'ScheduledTasks';

	this.ormenabled = true;
	this.ormsettings.dbcreate = 'update';
	this.ormsettings.flushAtRequestEnd = false;
	this.ormsettings.autoManageSession= false;

	/* Error Logging Settings */

	function onRequestStart()
{
	application.name = this.name;
	application.error.console.server = 'http://192.168.11.200/endpoint';
	application.error.console.port = '8090';
}



}