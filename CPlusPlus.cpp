//***************************************************************************************
//
//   CUADERNO DE APUNTES DE COMANDOS DE C PLUS PLUS
//   por: Necrovalle
//   gitHub: <por definir>
//
//***************************************************************************************

// Comunicacion I2C desde C++ en raspberry pi:--------------------------------------- (1)
//	a) incluir librerias:
#include <wiringPi.h>
#include <wiringPiI2C.h>
//	b) conectar con el dispositivo esclavo con:
int fd = wiringPiI2CSetup(0x05);
//		- 0x05 es la direccion exadecimal del hardware esclavo
//	c) Escritura en le esclavo:
int Esc = wiringPiI2CWrite(fd, 0xA0);
//		- 0xA0 es el dato que se envio
//	d) Lectura del esclavo:
int Ent = wiringPiI2CRead(fd);
//	e) Para compilar us
//		- $ g++ -o i2c_test i2c_test.cpp -lwiringPi
//	Nota.- No se ha cerrado la comunicacion, investigar este paso para implementarlo.

// Para hacer uso de comandos de shell en c++ usar:---------------------------------- (2)
system("comando");
//		- El comando debe de ser un nombre de un arreglo de caracteres
//		  la variable string no es compatible (castear a char array)

// Tratamiento de strings y cadena de caracterers en C++:---------------------------- (3)
//	a) Casteo de cadena de caracteres a string:
STR(cad_caracteres);
//	b) Casteo de string a cadena de caracteres:
int nC = txStr.length();
char cad_caracteres[nC+1];
strcpy(cad_caracteres, txStr.c_str());
//	c) Casteo de int a string:
#include <sstream>
ostringstream foo;
foo << intNumber;
string strVal = foo.str();



