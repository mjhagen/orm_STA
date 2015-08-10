component persistent='true' table='sms' {

	property name='id' fieldtype='id' generator='guid';

	property name='key' length='100';
	property name='token' length='100';
	property name='sender' length='100';
}