<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <title>
	    <cfoutput>
	        #arguments.title#
	    </cfoutput>
    </title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/font-awesome.css" rel="stylesheet">
    <link href="/assets/css/ace.css" rel="stylesheet">
	
	<cfoutput>
        #structKeyExists( local, 'header' ) ? local.header : ''#
	</cfoutput>
	
</head>
<body>
	<div class="container">
		