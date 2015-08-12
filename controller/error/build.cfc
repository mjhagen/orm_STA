component extends='controller.base.template' {

	public string function get( required string errorcode, string errortext )
	{
		var result = '';

		try {

			savecontent variable='local.result' {
				include '/render/error/_#errorcode#.cfm';
			}

		} catch ( any e ) {
			e.special = 'Error Page Missing: ' & arguments.errorcode & ' - ' & e.message;
			this.report( e );
			this.get( '500', 'Server had an error' );
		}

		result = this.wrap( result );

		return result;
	}

}