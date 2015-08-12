component extends='controller.form.section'{

	public void function init( array cols = [ 6, 6 ] )
	{
		variables.col = {
			left: arguments.cols[ 1 ],
			right: arguments.cols [ 2 ]
		};
		variables.script = {
			scripts: "",
			header: "",
			footer: "</script>",
			body: "",
			included: []
		};
	}

	public string function get( required formEntity, string id = '', string action = '##', string classes='form-horizontal', array fieldOrder )
	{
		if ( !structKeyExists( variables, 'script') )
		{
			this.init();
		}

		var result = '';
		var properties = this.meta( arguments.formEntity, 'properties' );
		var fullName = this.meta( arguments.formEntity, 'fullname' );
		var errorName = this.meta( arguments.formEntity );
		var value = '';

		if ( structKeyExists( arguments, 'fieldOrder' ) )
		{
			for ( var orderElement in arguments.fieldOrder )
			{
				for ( var element in properties )
				{
					if ( element.name eq orderElement )
					{
						value = !isNull( arguments.formEntity[ 'get' & element.name ]() ) ?
							arguments.formEntity[ 'get' & element.name ]() : '';
						element.fullName = fullName;
						element.errorName = errorName;
						result &= this.build( element, value );
					}
				}
			}

		} else {
			properties.sort(function(e1, e2){
				var e1Compare = e1.view_order ?: 99;
				var e2Compare = e2.view_order ?: 99;
				return sgn(e1Compare - e2Compare);
			});

			for ( var element in properties )
			{
				if ( !structKeyExists( element, 'fieldtype' ) || !find ( '-to-', element.fieldtype ) )
				{
					value = !isNull( arguments.formEntity[ 'get' & element.name ]() ) ?
						arguments.formEntity[ 'get' & element.name ]() : '';
					element.fullName = fullName;
					element.errorName = errorName;
					result &= this.build( element, value );
				}
			}
		}

		result = this.wrapper( result, arguments.id, arguments.action, arguments.classes );

		return result;
	}

	private string function wrapper( required string content, required string id, required string action, required string classes, boolean hasFile = false ) {
		if ( !len( arguments.id ) )
		{
			var id = 'form_' & randRange( 1000, 9999 );
		} else {
			var id = arguments.id;
		};
		var content = arguments.content;
		var result = '';

		savecontent variable ='local.result' {
			include '/render/form/_form.cfm';
		}
		return result;
	}


}