--***************************************************************************************
--*
--*   CUADERNO DE APUNTES DE COMANDOS DE mySQL
--*   por: Necrovalle
--*   gitHub: <por definir>
--*
--***************************************************************************************

-- instalacion de una base de datos:------------------------------------------------- (1)
--	a) Se elegio mariaDB por su compatibilidads a SQL instalandolo con:
--	b) $ sudo apt-get install mariadb-server
--	c) https://www.luisllamas.es/como-instalar-mariadb-en-raspberry-pi/
--	nota.- para arreglar el problema de acceso se siguio las indicaciones de:
--	https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost
--	d) Se usaron los siguientes datos de ususrio:
--		- root
--		- DataB

-- Creaccion de base de datos con la estructura necesaria:--------------------------- (2)
CREATE DATABASE cimav_test;
USE cimav_test;
CREATE TABLE datos (
	id INT(10) NOT NULL AUTO_INCREMENT,
	equipo VARCHAR(25) NOT NULL,
	estado VARCHAR(3) NOT NULL,
	usuario VARCHAR(35) NOT NULL,
	t_inicio VARCHAR(25) NOT NULL,
	t_final VARCHAR(25) NOT NULL,
	temp_sp INT(10) NOT NULL,
	PRIMARY KEY (id));
CREATE TABLE acciones (
	id INT(10) NOT NULL AUTO_INCREMENT,
	acn VARCHAR(1) NOT NULL,
	PRIMARY KEY (id));
	
-- Creaccion de usuario nuevo para uso de la base de datos:-------------------------- (3)
CREATE USER admin IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON cimav_test.* TO 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
--	nota.- este usuario puede hacer uso de la base de datos en su totalidad sin 
--	necesidad de logearse con sudo, por lo que puede ser usado por C++ y por node.js

-- Añadir columna al final de una tabala en una base de datos:----------------------- (4)
ALTER TABLE nombre_tabla ADD nueva_columna VAR(60);

-- Cambia de datos en una casilla de la base de datos:------------------------------- (5)
UPDATE tabla SET rango='val' WHERE id=#;

-- Borra una columna de una tabla en la base de datos:------------------------------- (6)
ALTER TABLE nombre_tabla DROP COLUMN nombre_columna;

-- Para restablecer los valores de una tabal a cero usar:---------------------------- (7)
TRUNCATE TABLE nmbre_tabla;

-- Para limpiar la ventana en linux usar CTRL + L------------------------------------ (8)

-- Para añadir un nuevo renglon en una tabla usar:----------------------------------- (9)
INSERT INTO bitacora(usuario, fecha, t_inicio, t_final, equipo, sp)
VALUES ("uno@cc.net", "25/06/2021", "16:00", "16:20", "Horno No1", 250);

-- Para eliminar una tabla usar:----------------------------------------------------- (10)
DROP TABLE nombre_de_la_tabla;
