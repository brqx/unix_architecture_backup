#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- was_load_parameters
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Carga los parametros para conexion contra un was
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was load parameters carga parametros conexion
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [ID_WAS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E was_load_parameters  	-- Carga parametros conexion WAS
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#alias cargar_datos_was
was_load_parameters()
{
IS_was_load_parameters="Carga los parametros para conectarte a un was indicado"
INFO_SCRIPT=${IS_was_load_parameters}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_was_load_parameters=${INFO_SCRIPT}

ID_WAS=${1}
FICHERO=${2}
SEP=${3}

SALIDA_was_load_parameters=0

NOMBRE_SCRIPT_was_load_parameters=was_load_parameters
PARAMETROS_SCRIPT_was_load_parameters="[ID_WAS]"

if [ "${ID_WAS}" == "" ]; then
	ID_WAS=soa7a
fi  

if [ "${FICHERO}" == "" ]; then
FICHERO=${RS_CONN}zwas_noproxy_login.dat
fi

if [ "${SEP}" == "" ]; then
SEP=":"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_was_load_parameters} ${PARAMETROS_SCRIPT_was_load_parameters}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_FICHERO=$(cat ${FICHERO} | grep "^${ID_WAS}" )
ERROR_grep=$?


if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Carga parametros Was
#----====----====----====----====----====----====----====----====---

SERVER=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f2 )
PORT=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f4 )
USUARIO_CONEXION=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f3 )
RUTA_WAS=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f5 )

#-Ajuste SOA - tres servidores
NOMBRE_SERVIDOR_01=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f8 )


NOMBRE_COMANDO_MANAGER="startManager.sh"
NOMBRE_COMANDO_NODO_01="startNode.sh"
NOMBRE_COMANDO_SERVIDOR_01="startServer.sh ${NOMBRE_SERVIDOR_01}"

LINEA_COMANDO_MANAGER=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f6 )${NOMBRE_COMANDO_MANAGER}
LINEA_COMANDO_NODO_01=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_NODO_01}
LINEA_COMANDO_SERVIDOR_01=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_SERVIDOR_01}


MOTIVO_FUNCION="Codigo Correcto"
PARAMETROS_MOTIVO_01="Servidor    : ${SERVER}"
PARAMETROS_MOTIVO_02="Puerto      : ${PORT}"
PARAMETROS_MOTIVO_03="Usuario     : ${USUARIO_CONEXION}"
PARAMETROS_MOTIVO_04="Manager     : ${LINEA_COMANDO_MANAGER}"
PARAMETROS_MOTIVO_05="Nodo 01     : ${LINEA_COMANDO_NODO_01}"
PARAMETROS_MOTIVO_06="Servidor 01 : ${LINEA_COMANDO_SERVIDOR_01}"

else

SALIDA_was_load_parameters=1

MOTIVO_FUNCION="Identificador incorrecto"
PARAMETROS_MOTIVO_01="Codigo : ${ID_WAS}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Carga parametros Was
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_was_load_parameters}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_was_load_parameters}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_was_load_parameters}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_was_load_parameters}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
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

