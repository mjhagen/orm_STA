component extends='tools.translator.translate' {

	private string function wrap( required string name, required string namebase, required string content )
	{
		var result = '';
		var folder = this.meta();

		savecontent variable='local.result' {
			include '/render/#folder#/_wrap.cfm';
		}

		return result;
	}

}