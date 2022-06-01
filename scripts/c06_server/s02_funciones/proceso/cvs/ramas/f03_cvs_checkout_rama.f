#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="server"
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="proceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- cvslist
#-------------------------------------------------------------------
# Ejemplo base:
#-------------------------------------------------------------------
# Informacion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#- Hace un checkout del modulo indicado como parametro y la rama
cvscr()
{

#- Obtener toda la rama
##cvs checkout -r v0_0_0_3 MAPFRE_ARQOS_COMMONS_DIST
#- Generar una carpeta para la rama
## Tendriamos el resultado MAPFRE_ARQOS_COMMONS_DIST_v10_4

PROYECTO=$1
RAMA=$2

#- Hay que definir un proyecto y una rama por defecto

if [ "${PROYECTO}" == "" ] ; then
#- Si no se le dice proyecto, sacamos MAPFRE_ARQOS_COMMONS_DIST

PROYECTO=MAPFRE_ARQOS_COMMONS_DIST

else
#- Sabemos que llega un proyecto
#- Si no llega una rama deberia bajar el HEAP

if [ "${RAMA}" == "" ] ; then
RAMA=heap

fi

fi


RUTA_ACTUAL=$PWD

#- Creamos la ruta donde lo colocaremos
mkdir ${BIBLIOTECAS_LOCALES}${PROYECTO} 2> /dev/null

#- Nos vamos a la ruta y hacemos el checkout
cd ${BIBLIOTECAS_LOCALES}/${PROYECTO} 2> /dev/null

cvs checkout  -r ${RAMA} ${PROYECTO}  ## 2&> /dev/null

mv ${PROYECTO} ${RAMA}

cd ${RAMA}

#- Eliminamos .classpath - .project - .settings
rm -f  .classpath 2> /dev/null
rm -f  .project 2> /dev/null
rm -Rf  .settings/ 2> /dev/null
rm -Rf  CVS/ 2> /dev/null

cd ${BIBLIOTECAS_LOCALES}

#- Ajustamos los permisos de la biblioteca bajada
chown -R ibm:users *

cd ${RUTA_ACTUAL}

echo "--------------------------------------------------"
echo "Descarga CVS : ${URL_CVS_MAPFRE}:${REPOSITORIO_01}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Localizado en : ${BIBLIOTECAS_LOCALES}${PROYECTO}${RAMA}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Proyecto     : ${PROYECTO}								  "
echo "Rama         : ${RAMA}									  "
echo "--------------------------------------------------"
}
