component extends='tools.error.report' {

	public string function translate( required string namespace, string locale = session.locale )
	{
		var result = arguments.namespace;
		var data = {
			namespace: arguments.namespace,
			locale: arguments.locale
		};

		if ( !structKeyExists( application, 'translations' ) )
		{
			application.translations = {};
		};
		if ( !structKeyExists( application.translations, arguments.locale) )
		{
			application.translations[ arguments.locale ] = {};
		};

		if ( structKeyExists( application.translations[ arguments.locale ], arguments.namespace ) )
		{
			var result = application.translations[ arguments.locale ][ arguments.namespace ];
		} else {
			transaction {
				var trans_entity = entityLoad( 'translation', data );
			};

			if ( arraylen(trans_entity) )
			{
				result = trans_entity[1].getTranslation();
				application.translations[ arguments.locale ][ arguments.namespace ] = result;
			} else {
				this.translation_new( data );
			}
		}

		return result;
	}

	private void function translation_new( required struct data )
	{
		transaction {

			var entity = entityNew( 'translation' );

			entity.setNamespace( data.namespace );
			entity.setTranslation( data.namespace );
			entity.setLocale( data.locale );

			entitySave( entity );

		}

		this.error_console( 'new translation: ' & data.locale & ' - ' & data.namespace );
	}

}