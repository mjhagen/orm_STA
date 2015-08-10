<cfoutput>
    <input
        type="#local.type#"
        class="form-control"
        name="#arguments.element.name#"
        id="#arguments.element.name#"
        value="#arguments.value#"
        #( structKeyExists( arguments.element, 'length') ? 'maxlength="' & arguments.element.length & '"': '' )#
		#( structKeyExists( arguments.element, 'view_min' ) ? 'min="' & arguments.element.view_min & '"' : '' )#
		#( structKeyExists( arguments.element, 'view_max' ) ? 'max="' & arguments.element.view_max & '"' : '' )#
        #( arguments.isRequired ? 'required' : '' )#
	>
</cfoutput>