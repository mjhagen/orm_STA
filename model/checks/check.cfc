component persistent = 'true' table = 'checks' {

	property
			name =          'id'
			fieldtype =     'id'
			generator =     'guid'
			view_type =     'hidden'
			view_order =    1;

	property
			name =          'name'
			length =        '100'
			view_type =     'text'
			view_order =    2;
	property
			name =          'product'
			length =        '100'
			view_type =     'text'
			view_order =    3;
	property
			name =          'server'
			length =        '100'
			view_type =     'text'
			view_order =    4;
	property
			name =          'path'
			length =        '255'
			view_type =     'text'
			view_order =    5;
	property
			name =          'active'
			type =          'boolean'
			default =       1
			view_type =     'toggle'
			view_order =    6;
	property
			name =          'deleted'
			type =          'boolean'
			default =       0
			view_type =     'false';
	property
			name =          'interval'
			fieldtype =     'one-to-one'
			cfc =           'model.checks.interval'
			mappedby =      'check'
			view_type =     'false';
	property
			name =          'errorActions'
			fieldtype =     'one-to-many'
			cfc =           'model.checks.errorAction'
			fkcolumn =      'fk_check'
			type =          'array'
			view_type =     'false';
	property
			name =          'log'
			fieldtype =     'one-to-many'
			cfc =           'model.logging.log'
			fkcolumn =      'fk_check'
			type =          'array';
}