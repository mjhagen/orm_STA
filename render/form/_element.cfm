<!--- Wraps an element --->
<cfoutput>
    <div class="form-group">
        <label
            for="#arguments.name#"
            class="col-sm-#variables.col.left# control-label no-padding-right"
        >
			#arguments.name#
        </label>
	    <div class="col-sm-#variables.col.right#">
			#arguments.context#
	    </div>
    </div>
    <div class="space-4"></div>
</cfoutput>