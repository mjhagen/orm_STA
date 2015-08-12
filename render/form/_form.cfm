<!--- Wraps the entire form --->
<cfoutput>
    <form
        class="form#( len( arguments.classes ) ? ' ' & arguments.classes : '' )#"
        action="#arguments.action#"
        id="#local.id#"
        name="#local.id#"
		#( arguments.hasFile ? ' enctype="multipart/form-data"' : '' )#
    >
		#arguments.content#
    </form>
</cfoutput>