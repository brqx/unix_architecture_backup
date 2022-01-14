#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- was_load_parameters_wsrun
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Carga los parametros para ejecutar comandos contra un was
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was load parameters carga parametros detencion
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [ID_WAS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E was_load_parameters_wsrun  	-- Carga parametros para usar wsadmin contra un was
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

was_load_parameters_wsrun()
{
IS_was_load_parameters_wsrun="Carga los parametros para interactuar contra un  was indicado"
INFO_SCRIPT=${IS_was_load_parameters_wsrun}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_was_load_parameters_wsrun=${INFO_SCRIPT}

ID_WAS=${1}
ARCHIVO_JACL=${2}
PARAMETROS_JACL=${3}
FICHERO_STOP=${4}
SEP=${5}

SALIDA_was_load_parameters_wsrun=0

NOMBRE_SCRIPT_was_load_parameters_wsrun=was_load_parameters_wsrun
PARAMETROS_SCRIPT_was_load_parameters_wsrun="ID_WAS "

if [ "${ID_WAS}" == "" ]; then
ID_WAS="-?"
fi  

if [ "${ARCHIVO_JACL}" == "" ]; then
ID_WAS="-?"
fi  

#- Los parametros pueden ser nulos
##if [ "${PARAMETROS_JACL}" == "" ]; then
##ID_WAS="-?"
##fi  

if [ "${FICHERO_STOP}" == "" ]; then
FICHERO_STOP=${RS_CONN}zwas_noproxy_stop.dat
fi

if [ "${SEP}" == "" ]; then
SEP=":"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_was_load_parameters_wsrun} ${PARAMETROS_SCRIPT_was_load_parameters_wsrun}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Nivel de seguridad a nivel de fichero de parada

LINEA_FICHERO_STOP=$(cat ${FICHERO_STOP} | grep "^${ID_WAS}" )
ERROR_grep=$?

if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Carga parametros Was
#----====----====----====----====----====----====----====----====---

USER_STOP_SERVER=$(echo ${LINEA_FICHERO_STOP} | cut -d ${SEP} -f2 )
PASS_STOP_SERVER=$(echo ${LINEA_FICHERO_STOP} | cut -d ${SEP} -f3 )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

was_load_parameters ${ID_WAS}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_was_load_parameters_wsrun=${SALIDA_was_load_parameters}

if [ "${SALIDA_was_load_parameters}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

#- Lanzamos la aplicacion
## sudo ${WPS_RUN_PATH}wsadmin.sh -username adm-soa -password adm-soa -f /opt/operaciones_arquitectura/reinicia_app_pmt.jacl SBDA_DelNUUMA_SMEDApp
## ${RUTA_VARIABLES}wsadmin.sh -f ${ARCHIVO_JACL}

NOMBRE_SERVIDOR=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f8 )

NOMBRE_COMANDO_SERVIDOR="wsadmin.sh -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER} -f ${ARCHIVO_JACL} ${PARAMETROS_JACL} "

LINEA_COMANDO_SERVIDOR=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_SERVIDOR_01}

MOTIVO_FUNCION="Codigo Correcto"

#-Como se limpian los parametros debemos volver a copiarlos
PARAMETROS_MOTIVO_01="Servidor 01 : ${SERVER}"
PARAMETROS_MOTIVO_02="Puerto      : ${PORT}"
PARAMETROS_MOTIVO_03="Usuario     : ${USUARIO_CONEXION}"

#-Parametros especificos de parada
PARAMETROS_MOTIVO_04="Comando     : ${LINEA_COMANDO_SERVIDOR_01}"

else

MOTIVO_FUNCION="Codigo Incorrecto en WAS"
PARAMETROS_MOTIVO_01="Codigo : ${ID_WAS}"

#--------========--------========--------========--------========---
#------- [2] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi
else

SALIDA_was_load_parameters_wsrun=1

MOTIVO_FUNCION="Identificador incorrecto en WAS STOP"
PARAMETROS_MOTIVO_01="Codigo : ${ID_WAS}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Carga parametros Was
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_was_load_parameters_wsrun}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_was_load_parameters_wsrun}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_was_load_parameters_wsrun}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_was_load_parameters_wsrun}
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

