component persistent = 'true' table = 'translations' {

	property
			name =          'id'
			fieldtype =     'id'
			generator =     'guid'
			view_type =     'hidden'
			view_order =    1;

	property
			name =          'namespace'
			length =        '512'
			view_type =     'text'
			view_order =    2;
	property
			name =          'locale'
			length =        '3'
			view_type =     'text'
			view_order =    3;
	property
			name =          'translation'
			length =        '512'
			view_type =     'text'
			view_order =    4;

}