component extends='tools.translator.translate' {

	public string function template( required string content, string title = application.name )
	{
		var result = '';

		savecontent variable='local.result' {
			include '/render/template/_header.cfm';
			writeOutput( arguments.content );
			include '/render/template/_footer.cfm';
		}

		return result;
	}

	private string function wrap( required string content, string fullName = '', string name  )
	{
		var result = '';
		var folder = this.meta();
		var fullName = len( arguments.fullName ) ? arguments.fullName : this.meta( this, 'fullname' );

		savecontent variable='local.result' {
			include '/render/#folder#/_wrap.cfm';
		}

		return result;
	}

}