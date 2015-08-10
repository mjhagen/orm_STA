<cfoutput>
    <textarea
        class="form-control ace ace-switch ace-switch-6"
        name="#arguments.element.name#"
        id="#arguments.element.name#"
        #( arguments.isRequired ? 'required' : '' )#
    >
        #arguments.value#
    </textarea>
</cfoutput>