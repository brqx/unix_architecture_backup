#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2010"
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- r_espacio
#-------------------------------------------------------------------
#-- r_dame_espacio_ruta
#-------------------------------------------------------------------
#-- r_espacio_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- r_dame_espacio_ruta : Devuelve el espacio ocupado en esa ruta
#- r_espacio      : Informa del espacio ocupado
#- r_espacio_out  : Inserta en un archivo la informacion sobre el espacio
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# espacio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

r_espacio()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

RUTA_ESPACIO=$3

#- Cambiar httpd x apache -- servidor x work
r_dame_espacio_ruta $@
linea_espacio=${RETURN_ESPACIO_RUTA}

HORA_ACTUAL=`date +%H_%M_%S`
echo "Espacio en ruta ${RUTA_ESPACIO} - ${HORA_ACTUAL} : ${linea_espacio} "

}

#-------------------------------------------------------------------

r_espacio_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

RUTA_ESPACIO=$3
ARCHIVO=$4

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

r_dame_espacio_ruta $@
linea_espacio=${RETURN_ESPACIO_RUTA}

HORA_ACTUAL=$(date +%H_%M_%S)
echo "${HORA_ACTUAL}:${linea_instancias}" >> ${RUTA_OUT}/${ARCHIVO}_espacio_servidor.dat
}


#-------------------------------------------------------------------

#- Devuelve solo el valor
r_dame_espacio_ruta()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------


SERVER=${1}
PORT=${2}
USUARIO_CONEXION=${3}
RUTA_ESPACIO=${4}



if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
##	SERVER=ibrqx
SERVER=core
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  

if [ "${RUTA_ESPACIO}" == "" ]; then
## Activamos un proceso por defecto
##	RUTA_ESPACIO=/tmp
RUTA_ESPACIO=/
fi  

if [ "${USUARIO_CONEXION}" == "" ]; then
#- Establecemos el usuario
USUARIO_CONEXION=ibm
fi  


#- Esto funciona
linea_espacio=$(ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "df -h ${RUTA_ESPACIO} | tail -1 | tr -s ' ' | cut -d' ' -f4-5" )
RETURN_ESPACIO_RUTA=${linea_espacio}

}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

