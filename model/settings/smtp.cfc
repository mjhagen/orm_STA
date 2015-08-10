component persistent='true' table='smtp' {

	property name='id' fieldtype='id' generator='guid';

	property name='server' length='100';
	property name='sender' length='100';
	property name='username' length='100';
	property name='password' length='100';
	property name='port' length='3';
	property name='ssl' type='boolean' default=false;
	property name='tls' type='boolean' default=false;
}