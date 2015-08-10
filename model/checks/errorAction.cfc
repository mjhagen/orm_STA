component persistent='true' table='errorActions' {

	property name='id' fieldtype='id' generator='guid';

	property name='type' length='20';
	property name='receiver' length='100';
	property name='check' fieldtype='many-to-one' cfc='check' fkcolumn='fk_check';
}