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
#-- r_instancias_proceso
#-------------------------------------------------------------------
#-- r_instancias_proceso_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- r_instancias      : Devuelve las instancias de Apache en un momento dado
#- r_instancias_out  : Inserta en un archivo la memoria libre
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# r_instancias_apache ibrqx 22
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

r_instancias_proceso()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#- Esto funciona
r_dame_instancias_proceso $@

#- Recuperamos el valor de retorno
linea_instancias=$?

#- No se recupera el valor

HORA_ACTUAL=`date +%H_%M_%S`
echo "Instancias del Servidor Apache- ${HORA_ACTUAL} : ${linea_instancias} "

}

#-------------------------------------------------------------------

r_instancias_proceso_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$3

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

#- Esto funciona
r_dame_instancias_proceso $@

#- Recuperamos el valor de retorno
linea_instancias=$?

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${linea_instancias}" >> ${RUTA_OUT}/${ARCHIVO}_instancias_servidor.dat
}


#-------------------------------------------------------------------

r_dame_instancias_proceso()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#- Establecemos el usuario
USUARIO_CONEXION=ibm


SERVER=${1}
PORT=${2}
USUARIO_CONEXION=${3}
PROCESO=${4}



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

if [ "${PROCESO}" == "" ]; then
## Activamos un proceso por defecto
##	PROCESO=java
PROCESO=apache
fi  

if [ "${USUARIO_CONEXION}" == "" ]; then
#- Establecemos el usuario
USUARIO_CONEXION=ibm
fi  


#- Esto funciona
linea_instancias=$(ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "ps -eaf | grep ${PROCESO} | grep -v 'grep' | wc -l " )

RETURN_INSTANCIAS_PROCESO=${linea_instancias}
return ${linea_instancias}

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

