Hello world
<cfscript>
	ormReload();
	transaction {
		check = entityLoadByPK( 'check', '98CDF2C1-3EB6-40BA-A602-8CF8D6A10BA9' );
	}


	variables.form = createObject( 'component', 'controller.form.build' );
	variables.form.init([4,8]);
	variables.formHtml = variables.form.get( check );
</cfscript>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="/assets/css/screen.css" rel="stylesheet">
    <link href="/assets/css/print.css" rel="stylesheet">
    <link href="/assets/css/ie.css" rel="stylesheet">
    <link href="/assets/css/styles.css" rel="stylesheet">
    <link href="/assets/css/font-awesome.css" rel="stylesheet">
    <link href="/assets/css/ace.css" rel="stylesheet">


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-8">
				<cfoutput>
					#variables.formHtml#
				</cfoutput>
			</div>
		</div>

	</div>
</body>
</html>