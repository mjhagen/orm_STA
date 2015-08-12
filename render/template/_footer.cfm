
		</div>
	</body>

	<cfoutput>
		#structKeyExists( local, 'footer' ) ? local.footer : ''#
	</cfoutput>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

	<cfoutput>
		#structKeyExists( local, 'script' ) ? local.script : ''#
	</cfoutput>

</html>