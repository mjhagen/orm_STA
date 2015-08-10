<cfoutput>
    <input
        type="checkbox"
        class="form-control ace ace-switch ace-switch-6"
        name="#arguments.element.name#"
        id="#arguments.element.name#"
        #( arguments.value EQ 1 ? 'checked' : '' )#
    >
    <span class="lbl"></span>
</cfoutput>