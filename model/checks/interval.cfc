component persistent = 'true' table = 'interval' {

	/* ID */
	property
			name =          'id'
			fieldtype =     'id'
			generator =     'guid'
			view_type =     'hidden'
			view_order =    1;

	/* Other properties */
	property
			name =          'dayofmonth'
			type =          'integer'
			default =       ''
			view_type =     'integer'
			view_min =      '1'
			view_max =      '28'
			view_order =    2;
	property
			name =          'dayofweek'
			type =          'integer'
			default =       ''
			view_type =     'integer'
			view_min=       '1'
			view_max =      '7'
			view_order =    3;
	property
			name =          'time'
			length =        '100'
			default =       ''
			view_type =     'text'
			view_order =    4;
	property
			name =          'interval'
			length =        '100'
			default =       ''
			view_type =     'integer'
			view_order =    5;
	property
			name =          'check'
			fieldtype =     'one-to-one'
			cfc =           'check'
			fkcolumn =      'fk_check'
			view_type =     'false'
			view_order =    6;
}