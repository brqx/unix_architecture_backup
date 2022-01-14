#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="testing"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- r_damecarga
#-------------------------------------------------------------------
#-- r_carga_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- r_damecarga : Devuelve la carga del sistema en un momento dado
#- r_carga_out : Va insertando la carga del sistema en un fichero pasado 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# r_damecarga
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


r_carga()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

r_damecarga $@
linea_carga=${RETURN_LINEA_CARGA}

CARGA_01_MIN=$(echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1)
CARGA_05_MIN=$(echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1)
CARGA_15_MIN=$(echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1)

echo "Carga del sistema (Ultimo minuto) : ${CARGA_01_MIN} "
echo "Carga en los ultimos 5/15 minutos : ${CARGA_05_MIN} / ${CARGA_15_MIN}"

}


#-------------------------------------------------------------------

r_linea_carga()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

r_damecarga $@
linea_carga=${RETURN_LINEA_CARGA}

CARGA_01_MIN=$(echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1)
CARGA_05_MIN=$(echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1)
CARGA_15_MIN=$(echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1)

RETURN_LINEA_CARGA="${CARGA_01_MIN} / ${CARGA_05_MIN} / ${CARGA_15_MIN}"

}


#-------------------------------------------------------------------

r_carga_out()
{
RUTA_OUT=$PWD

r_damecarga $@
linea_carga=${RETURN_LINEA_CARGA}

ARCHIVO=$3

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

CARGA_01_MIN=$(echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1)
CARGA_05_MIN=$(echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1)
CARGA_15_MIN=$(echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1)

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${CARGA_01_MIN}" >> ${RUTA_OUT}/${ARCHIVO}_carga_sistema.dat

}

#-------------------------------------------------------------------

r_damecarga()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

#- Establecemos el usuario
USUARIO_CONEXION=ibm

SERVER=${1}
PORT=${2}
USUARIO_CONEXION=${3}


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

if [ "${USUARIO_CONEXION}" == "" ]; then
#- Establecemos el usuario
USUARIO_CONEXION=ibm
fi  

#- Esto funciona
linea_carga=$(ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "uptime | tr -s ' '" )

RETURN_LINEA_CARGA=${linea_carga}

}

#-------------------------------------------------------------------


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


