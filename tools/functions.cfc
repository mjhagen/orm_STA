component {

	private void function http_addparams( required obj_http, required array params )
	{
		for ( element in arguments.params )
		{
			arguments.obj_http.addParam( argumentCollection: element );
		}
	}

	private any function meta( object = this, string type = 'name' )
	{
		var meta = getMetadata( arguments.object );
		var result = '';

		if ( arguments.type eq 'name' )
		{
			var name = meta.fullname;
			result = listGetAt( name, listLen( name, '.' ) - 1, '.' );
		} else {
			result = meta[ arguments.type ];
		}

		return result;
	}

}
