component extends='controller.base.template' {

	public string function get( required string errorcode, string errortext='' )
	{
		var result = '';
		var errorText = len( arguments.errortext ) ? arguments.errortext : 'error.' & arguments.errorcode & '.subheader';

		try {

			savecontent variable='local.result' {
				include '/render/error/_#errorcode#.cfm';
			}

		} catch ( any e ) {
			e.special = 'Error Page Missing: ' & arguments.errorcode & ' - ' & e.message;
			this.report( e );

			savecontent variable='local.result' {
				include '/render/error/_generic.cfm';
			}

		}
		result = this.wrap( result, arguments.errorcode, errortext );

		result = this.template( result );

		return result;
	}

}