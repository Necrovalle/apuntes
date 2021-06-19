//***************************************************************************************
//
//   CUADERNO DE APUNTES DE COMANDOS DE JAVASCRIPT
//   por: Necrovalle
//   gitHub: <por definir>
//
//***************************************************************************************

// Implemetacion de web sockets en el proyecto:-------------------------------------- (1)
//	a) $npm install socket.io
//	b) se levantan los servicios de socket.io en el index.js con require
//	c) se habilita una carpetra para envio de archivos estaticos con express.static
//	d) se debe incluir el archivo script socket.io.js en el proyecto HTML
//	e) ejecutar io() en un script propio de la pagina (script.js)
//	f) habilitar el evento io.on en el script del servidor
//	g) ademas de los listeners para cada comunicacion socket.on

// Habilitar tareas a botones del DOM:----------------------------------------------- (2)
//	a) en el script del cliente adquirir los eventos de los botones
//	b) vincular las acciones de los botones con:
accion.addEventListener('click', function(){});
//	c)  para capturar los mensajes del servidor usar
socket.on('accion', function(data){});
//	d) el desarrollo se baso en:
//		- https://socket.io/get-started/chat/
//		- https://www.youtube.com/watch?v=0wqteZNqruc

// Incorporar mysql.js en node.js:--------------------------------------------------- (3)
//	a) $ npm install mysql
//	b) incluir en el script del server lo siguiente:
let mysql = require('mysql');
let dataBase = mysql.createConnection ({
	host: 'localhost',
	user: 'admin',
	password: '1234'
});
dataBase.query('USE cimav_test", function (err, result, fields){
	if (err) throw err;
	console.log(result);
});
dataBase.query('SELECT * FROM datos', function (err, result, fields){
	if (err) throw err;
	console.log(result);
});
//	c) Esto implementado del ejemplo de:
//	- https://miracomohacerlo.com/conectarse-base-datos-nodejs/
		
// Envio de correos desde node.js:--------------------------------------------------- (4)
//	a) Incluir el framework nodemailer:
let nodemailer = require('nodemailer');
//	b) Crear el transportador:
let transporte = nodemailer.createTransport({
	servive: 'Gmail',
	aut: {
		user: 'user@gmail.com',
		pass: 'password'
	}
});
//	c) Crear las opciones del correo:
let mailOptions = {
	from: 'user@gmail.com',
	to: 'to@gmail.com',
	text: 'cuerpo del correo'
}
//	d) Mandar el correo con:
transporte.sendMail(maioOptions, finction(error, info){
	if (error){ console.log(error);} else {
		console.log('Email enviado: ' + info.response);
	}
});	

// Implementacion de tareas periodicas:---------------------------------------------- (5)
//	a) Del lado del cliente:
setInterval(nombreDeLaFuncion(), 1000); //cada 1000 ms
//	b) Del lado del sewrvidor:
setInterval(nombreDeLaFuncion, 1000); //cada 1000 ms

// Tratamiento de popups en el script:----------------------------------------------- (6)
let popAcerca = document.getElementById('btnAcercade');
let ovlAcerca = document.getElementById('overlay-primera');
let winAcerca = document.getElementById('pop-primera');
let closeAcerca = document.getElementById('btn_cerrar');
popAcerca.addEventListener('click', function{
	ovlyAcerca.classList.add('active');
	winAcerca.classList.add('active');
});
closeAcerca.addEventListener('click', function(e){
	e.preventDefault();
	ovlyAcerca.classList.remove('active');
	winAcerca.classList.remove('active');
});

// Añadir una linea la final de un archivo de texto en node.js:---------------------- (7)
//	b) Codigo:
let fs = require('fs');
fs.appendFile('file.txt', 'Nueva entrada', function(err){
	if (err) {
		console.log(err);
	} else {
		console.log('Done');
	}
});

// Para obtener la hora via web con:
// http://worldtimeapi.org/api/timezone/America/Chihuahua.txt	

