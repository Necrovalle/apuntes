#****************************************************************************************
#
#   CUADERNO DE APUNTES DE COMANDOS PARA USO DE RASPBERRY PI
#   por: Necrovalle
#   gitHub: <por definir>
#
#****************************************************************************************

# Levantamiento de servicios propios de raspbian:------------------------------------- (1)
#	a) expandir SSD:
sudo raspi-config
#		- Advanced Options
#		- A1 Expand Filesystem
sudo reboot

#	b) Servicios SSH:
sudo raspi-config
#		- Interfacing Options
#		- P2 SSH
sudo reboot

# Servicios I2C:
sudo raspi-config
#		- Interfacing Options
#		- P5 I2C
#		- sudo reboot

# Levantamiento del servidor FTP:---------------------------------------------------- (2)
sudo apt-get update
sudo apt-get install vsftpd
sudo nano /etc/vsftpd.conf
#	d) editar en el archivo descomentando o escriviendo:
#		- anonymous_enable=NO
#		  local_enable=YES
#		  rite_enable=YES
#		  local_umask=022
#		  chroot_local_user=YES
#		  user_sub_token=$USER
#		  local_root=/home/$USER/FTP

#	b) Crear los directorios de trabajo
mkdir /home/<user>/FTP
mkdir /home/<user>/FTP/files
chmod a-w /home/<user>/FTP
sudo service vsftpd restart
#	c) Se conecta con la IP del dispositivo en el puerto 21

# Creacion de servidor con nginx----------------------------------------------------- (3)
#	a) https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md
sudo apt install nginx
sudo /etc/init.d/nginx start
#		- la direccion del archivo principal esta en:
cd /etc/nginx/sites-availabl
sudo nano default
#		- cambiar o cometar la linea root /var/www/html; por:
#		- root <<directorio nuevo de trabajo>>;
#		- en el directorio nuevo de trabajo, se enviara el archivo index.html
#		- por ultimo resetear el servicio de nginx
sudo systemctl restart nginx
#		Nota: nginx no soporta comunicacion dinamica bidireccional ni interpretacion
#			  de javascript.

# Creacion de servidor con node.js--------------------------------------------------- (4)
#	a) Se instalo la version de los repositorios ya que la actual no esta  soportada 
#      con procesadores armv6 en (versiones de raspberry pi 3 en adelante si)
sudo apt-get install nodejs
sudo apt-get install npm
#	b) Levantar un servidor con:
npm init 
#		- para crear el json del server
npm install express --save
#		- para utilizar el recursos de servidor pequeño y agil de express
#		- crear el archivo basico de arrannque de express index.js
#		- crear la carpeta de public dende estan los archivos a subir a la web
#		- crear el archivo index.html que es el que se mostrara de primera instancia
#		- todo esto siguiendo las instrucciones de la siguiente liga:
#		- https://www.pensemosweb.com/como-crear-servidor-web-5-minutos-nodejs/

# Preparacion para comunicación I2C:------------------------------------------------- (5)
#	a) Para identificar el SO:
uname -a
#	b) Identificar la version de las Raspberry
cat /proc/cpuinfo
#	c) pinout para Raspberry Pi Model B Rev 2:
#		     3.3V [01] [02] 5V
#      GPIO2/SDA1 [03] [04] 5V
#      GPIO3/SCL1 [05] [06] GND
#    GPIO4/GPCLK0 [07] [08] GPIO14/UART0_TXD
#             GND [09] [10] GPIO15/UART0_RXD
#          GPIO17 [11] [12] GPIO18/PCM_CLK
#          GPIO27 [13] [14] GND
#          GPIO22 [15] [16] GPIO23
#            3.3V [17] [18] GPIO24
#GPIO10/SPIO_MOSI [19] [20] GND
# GPIO9/SPIO_MISO [21] [22] GPIO25
#GPIO11/SPIO_SCLK [23] [24] GPIO8/SPIO_CE0_N
#             GND [25] [26] GPIO7/SPIO_CE1_N
#		- Las entradas y salidas digitales son a 3.3V
#	d) Se empleo un arduino como dispositivo I2C con el firmware:
#		- https://github.com/Necrovalle/Driver_I2C
#	e) Se intalo la libreria wiring Pi con:
#		- sudo apt-get install wiringpi
#		- http://wiringpi.com/download-and-install/
#	f) Si se presenta el error de no existir el archivo de 12cdetect:
#		- https://skpang.co.uk/blog/archives/575
#		- usar el siguiente comando para ver dispositivos conectados
#		- sudo i2cdetect -y 1

# Hacer uso de la base de datos desde linea de comandos:----------------------------- (6)
#	a) mysql -u [usuario] -p[contraseña] -e "[comandos mysql]"
mysqp -u admin -p1234 -e "SELECT * FROM bitacora;"
#		- Importante poner la contraseña pegada al -p
#		- Los comandos entre comillas
#		- Se pude poner mas de un comando separado por un punto y coma
#	b) Siguiendo el manual de:
# www.raulprietofernandez.net
# /blog/pequenos-trucos/como-ejecutar-comandos-mysql-desde-bash-shell

# Comandos para poner el uso horario local en linux (Raspbian):---------------------- (7)
#	a) Identificar el que se esta usando con:
timedatectl status
#	b) Listar los usos horarios posibles a usar con:
timedatectl list-timezones
#	c) Cambiar la zona horaria con:
#		- sudo timedatectl set-timezone <time zone>
#		- ejemplo:
sudo timedatectl set-timezone Australia/Sydney
#		- utilizar </> y no <\> como separador

# Terminar con un proseso desde terminal:-------------------------------------------- (8)
#	a) Listar los procesos junto con su PID con:
ps -ef
#	b) Tras identificar el proceso a eliminar, terminarlo con:
kill PID

# Nota.- volver el servicio al inicio del istema operativo con:
# http://msrobotics.net/index.php/laboratorio-pi/
# 150-ejecutar-un-script-al-iniciar-sesion-en-tu-raspberry-pi

# Para conocer la temperatura de la CPU usar:---------------------------------------- (9)
vcgencmd measure_temp
# Para detener el server ejecutar:-------------------------------------------------- (10)
ps -ef
# Buscar el proceso node index.js e identificar su PID y Detenerlo con:------------- (11)
sudo kill PID	

# Para ver el valor que debuelve main en el programa ejecutado desde shell
echo $?

