#****************************************************************************************
#
#   CUADERNO DE APUNTES DE COMANDOS DE git
#   por: Necrovalle
#   gitHub: <por definir>
#
#****************************************************************************************

# Nota: se emplearan las siguientes zonas:
#	a) staying area: lugar en la carpeta de trabajo donde estan los archivos no tomados
#      en cuenta para seguimiento en git o de otra manera los no añadidos.
#	b) working area: lugar de los archivos que se estan siguiendo y se puedenm modificar
#      pero no forman parte del snapshoot.
#	c) commit area: lugar donde se guardo un estado fijo e identificado del codigo en 
#      los archivos que se estan siguiendo.
#	d) Usar como password de root: database

# Para inicializar el uso de git en un proyecto:------------------------------------- (1)
#	a) En la carpeta del proyecto ejecutar:
git init
		
# Para identificar los archivos y estado de los mismos:------------------------------ (2)
#	a) En la carpeta del proyecto ejecutar:
git status
		
# Para agregar un archivo al stayin area ejecutar:----------------------------------- (3)
git add <archivo>
	
# Para identificar el usuario de cambios de manera global ejecutar:------------------ (4)
git config --global user.email "<correo_del_desarrollador>"

# Para identificar el nombre del usuario de manera global ejecutar:------------------ (5)
git config --global user.name "<nombre_del_usuario>"
	
# Para pasar del staying area al repositorio usar:----------------------------------- (6)
#	a) Creando un snapshoot del codigo ejecutando:
git commit -m "<mensaje_del_commit>"

# Para identificar todos los commits realizados ejecutar:---------------------------- (7)
git log
	
# Para regresar los cambios efectuados a los archivos en el	working area a el actual
# commit area ejecutar:-------------------------------------------------------------- (8)
git checkout -- <archivo>
	
# Para identificar diferencias de un archivo entre el de working area contra el de 
# commit area ejecutar:-------------------------------------------------------------- (9)
git diff <archivo>

# Para ignorar archivos o carpetas en el 'git test' crear:-------------------------- (10)
#	a) un archivo en la carpeta raiz con el nombre:
.gitignore
#	b) incluir en ese archivo el nombre del archivo o carpeta a ignorar.
#	c) Pero hay que añadirlo al working area con:
git add .gitignore
#	d) Este proceso require tambien de un commit.
	
# Para identificar en que rama de desarrollo se esta, ejecutar:--------------------- (11)
git branch
	
# Para crear una nueva rama de desarrollo ejecutar:--------------------------------- (12)
git branch "<nueva_rama>"
	
# Para cambiar entre ramas de desarrollo ejecutar:---------------------------------- (13)
git checkout "<rama_deseada>"
	
# Para agragar el proyecto a un repositorio remoto realizar:------------------------ (14)
#	a) Crear nuevo proyecto en gitHub
#	b) ejecutar :
git remote add origin "url asignada por gitHub"
#	c) para subir los archivos ejecutar:
git push -u origin master
#	nota: se requiere dar permisos de gitHub para esta accion 
	
# Para clonar el proyecto ejecutar:------------------------------------------------- (15)
git clone "<URL proporcionada por gitHub>"
