component extends='controller.base.template' {

	public string function build( required struct element, required string value )
	{
		local.element = arguments.element;
		var isRequired = false;
		var result = '';

		if ( !structKeyExists( arguments.element, 'view_type' ) || arguments.element.view_type EQ 'false' )
		{
			return '';
		} else {

			if ( structKeyExists( element, 'default' ) )
			{
				isRequired = true;
			}

			try {
        var fn = this[ 'build_' & element.view_type ];
				result = fn( element, arguments.value, isRequired );
			} catch ( any e ) {
				e.special = 'component: ' & element.errorName & ' - field: ' & element.name & ' - ' & e.message;
				this.report( e );
				return '';
			}

			if ( arguments.element.view_type NEQ 'hidden' )
			{
				result = this.wrap( result, element.fullName, element.name );
			}

			return result;

		}
	}

	private string function build_integer( required struct element, required string value, required boolean isRequired )
	{
		var result = '';
		var type = 'number';
		savecontent variable='local.result' {
			include '/render/form/_basic.cfm';
		}
		return local.result;
	}

	private string function build_hidden( required struct element, required string value, required boolean isRequired )
	{
		var result = '';
		var type = 'hidden';
		savecontent variable='local.result' {
			include '/render/form/_basic.cfm';
		}
		return local.result;
	}

	private string function build_text( required struct element, required string value, required boolean isRequired )
	{
		var result = '';
		var type = 'text';
		savecontent variable='local.result' {
			include '/render/form/_basic.cfm';
		}
		return local.result;
	}

	private string function build_toggle( required struct element, required string value, required boolean isRequired )
	{
		var result = '';
		savecontent variable='local.result' {
			include '/render/form/_toggle.cfm';
		}
		return local.result;
	}


	private string function build_textarea( required struct element, required string value, required boolean isRequired )
	{
		var result = '';
		savecontent variable='local.result' {
			include '/render/form/_textarea.cfm';
		}
		return local.result;
	}

}
















