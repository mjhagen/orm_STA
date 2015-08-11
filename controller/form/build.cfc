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
		var meta = getMetadata( arguments.formEntity );
		var properties = meta.properties;
		var namebase = meta.fullname;
		var value = '';
		var fn = '';

		if ( structKeyExists( arguments, 'fieldOrder' ) )
		{
			for ( var orderElement in arguments.fieldOrder )
			{
				for ( var element in properties )
				{
					if ( element.name eq orderElement )
					{
						fn = arguments.formEntity[ 'get' & element.name ];

						value = !isNull( fn() ) ?
							fn() : '';
						element.namebase = namebase;
						result &= this.build( element, value );
					}
				}
			}

		} else {
			// todo: find ACF alternative
			// properties.sort(function(e1, e2){
			// 	var e1Compare = e1.view_order ?: 99;
			// 	var e2Compare = e2.view_order ?: 99;
			// 	return sgn(e1Compare - e2Compare);
			// });

			for ( var element in properties )
			{
				if ( !structKeyExists( element, 'fieldtype' ) || !find ( '-to-', element.fieldtype ) )
				{
					fn = arguments.formEntity[ 'get' & element.name ];
					value = !isNull( fn() ) ?
						fn() : '';
					element.namebase = namebase;
					result &= this.build( element, value );
				}
			}
		}

		result = wrapper( result, arguments.id, arguments.action, arguments.classes );

		return result;
	}

	private string function wrapper( required string content, required string id, required string action, required string classes, boolean hasFile = false ) {
		if ( !len( arguments.id ) )
		{
			local.id = 'form_' & randRange( 1000, 9999 );
		} else {
			local.id = arguments.id;
		};
		local.content = arguments.content;
		var result = '';

		savecontent variable ='local.result' {
			include '/render/form/_wrap.cfm';
		}
		return result;
	}



}