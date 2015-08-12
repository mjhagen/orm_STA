<cfscript>
	variables.formHtml = '';

	transaction {
		check = entityLoadByPK( 'check', '98CDF2C1-3EB6-40BA-A602-8CF8D6A10BA9' );
	}


	variables.form = createObject( 'component', 'controller.form.build' );
	variables.form.init([5,7]);


	variables.html = variables.form.get( check );

	variables.error = createObject( 'component', 'controller.error.build');

	variables.html = variables.error.get('404');
	/*variables.error = createObject( 'component', 'horse' );*/

</cfscript>

<cfoutput>
	#variables.html#
</cfoutput>