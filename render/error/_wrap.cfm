<cfoutput>
	<!--- close the container tag, we won't be using them here --->
	</div>

	<div class="jumbotron">
	    <div class="container text-center">
	        <h1>
				#this.translate( 'error.' & arguments.fullName & '.header' )#
	        </h1>
	        <p class="lead">
	            #this.translate( arguments.name )#
	        </p>
	        <p>
		        <a class="btn btn-primary btn-lg btn-success" href="/index" role="button">
					#this.translate( 'error.generic.back' )#
				</a>
			</p>
	    </div>
	</div>
	<div class="container">
		#arguments.content#
	</div>

	<!--- Reopen the container tag to maintain formatting --->
	<div class="container">
</cfoutput>