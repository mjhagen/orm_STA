component extends="error.report" {

	public string function build( required struct element, required string value )
	{
		var element = arguments.element;
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
				result = this[ 'build_' & element.view_type ]( element, arguments.value, isRequired );
			} catch ( any e ) {
				this.error_console( 'field: ' & element.name & ' - ' & e.message );
				return '';
			}

			if ( arguments.element.view_type NEQ 'hidden' )
			{
				result = this.wrap( element.name, result );
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

	private string function wrap( required string name, required string context )
	{
		var result = '';

		savecontent variable='local.result' {
			include '/render/form/_element.cfm';
		}

		return result;
	}

}















