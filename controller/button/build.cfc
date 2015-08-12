component extends='controller.base.template' {

	public string function get( array buttons )
	{
		writeDump(arguments);
		writeDump(cgi);
		writeDump(url);
	}

}