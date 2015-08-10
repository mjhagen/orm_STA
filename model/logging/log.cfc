component persistent='true' table='log' {

	property name='id' fieldtype='id' generator='guid';

	property name='regdate' type='timestamp' default='#now()#';
	property name='result' type='boolean';
	property name='error' length='4000';
	property name='check' fieldtype='many-to-one' cfc='check' fkcolumn='fk_check';
	property name='messages' fieldtype='one-to-many' cfc='message' fkcolumn='fk_event' type='array';
}