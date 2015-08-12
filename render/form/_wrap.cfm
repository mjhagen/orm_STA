<!--- Wraps an element --->
<cfoutput>
    <div class="form-group">
        <label
            rel="tooltip"
            for="#arguments.name#"
            class="col-sm-#variables.col.left# control-label no-padding-right"
			title="#this.translate( 'form.tooltip.' & arguments.namebase & '.' & arguments.name )#"
        >
			#this.translate( 'form.label.' & arguments.namebase & '.' & arguments.name )#
            <i class="fa fa-question-circle"></i>
        </label>
	    <div class="col-sm-#variables.col.right#">
			#arguments.content#
	    </div>
    </div>
    <div class="space-4"></div>
</cfoutput>