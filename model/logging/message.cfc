component persistent='true' table='repository' {

	property name='id' fieldtype='id' generator='guid';

	property name='type' length='20';
	property name='sender' length='100';
	property name='receiver' length='100';
	property name='content' length='255';
	property name='event' fieldtype='many-to-one' cfc='model.checks.check' fkcolumn='fk_event';
}