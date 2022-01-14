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
#-- was_load_parameters_stop_soa_cluster
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Carga los parametros para detener un was
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
#E was_load_parameters_stop_soa_cluster  	-- Carga parametros para detener un was
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

was_load_parameters_stop_soa_cluster()
{
IS_was_load_parameters_stop_soa_cluster="Carga los parametros para detener un  was indicado"
INFO_SCRIPT=${IS_was_load_parameters_stop_soa_cluster}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_was_load_parameters_stop_soa_cluster=${INFO_SCRIPT}

ID_WAS=${1}
FICHERO_STOP=${2}
SEP=${3}

SALIDA_was_load_parameters_stop_soa_cluster=0

NOMBRE_SCRIPT_was_load_parameters_stop_soa_cluster=was_load_parameters_stop_soa_cluster
PARAMETROS_SCRIPT_was_load_parameters_stop_soa_cluster="[ID_WAS]"

if [ "${ID_WAS}" == "" ]; then
	ID_WAS=soa7a
fi  

if [ "${FICHERO_STOP}" == "" ]; then
FICHERO_STOP=${RS_CONN}zwas_noproxy_stop.dat
fi

if [ "${SEP}" == "" ]; then
SEP=":"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_was_load_parameters_stop_soa_cluster} ${PARAMETROS_SCRIPT_was_load_parameters_stop_soa_cluster}

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

was_load_parameters_soa_cluster ${ID_WAS}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_was_load_parameters_stop_soa_cluster=${SALIDA_was_load_parameters_soa_cluster}

if [ "${SALIDA_was_load_parameters_stop_soa_cluster}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

NOMBRE_SERVIDOR_01=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f8 )
NOMBRE_SERVIDOR_02=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f9 )
NOMBRE_SERVIDOR_03=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f10 )


NOMBRE_COMANDO_MANAGER="stopManager.sh -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER}"
NOMBRE_COMANDO_NODO_01="stopNode.sh -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER}"

NOMBRE_COMANDO_SERVIDOR_01="stopServer.sh ${NOMBRE_SERVIDOR_01} -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER}"
NOMBRE_COMANDO_SERVIDOR_02="stopServer.sh ${NOMBRE_SERVIDOR_02} -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER}"
NOMBRE_COMANDO_SERVIDOR_03="stopServer.sh ${NOMBRE_SERVIDOR_03} -username ${USER_STOP_SERVER} -password ${PASS_STOP_SERVER}"


LINEA_COMANDO_MANAGER=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f6 )${NOMBRE_COMANDO_MANAGER}
LINEA_COMANDO_NODO_01=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_NODO_01}
LINEA_COMANDO_SERVIDOR_01=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_SERVIDOR_01}
LINEA_COMANDO_SERVIDOR_02=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_SERVIDOR_02}
LINEA_COMANDO_SERVIDOR_03=${RUTA_WAS}$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )${NOMBRE_COMANDO_SERVIDOR_03}

MOTIVO_FUNCION="Codigo Correcto"

#-Como se limpian los parametros debemos volver a copiarlos
PARAMETROS_MOTIVO_01="Servidor 01 : ${SERVER}"
PARAMETROS_MOTIVO_02="Puerto      : ${PORT}"
PARAMETROS_MOTIVO_03="Usuario     : ${USUARIO_CONEXION}"

#-Parametros especificos de parada
PARAMETROS_MOTIVO_04="Manager     : ${LINEA_COMANDO_MANAGER}"
PARAMETROS_MOTIVO_05="Nodo    01  : ${LINEA_COMANDO_NODO_01}"
PARAMETROS_MOTIVO_06="Comando 01  : ${LINEA_COMANDO_SERVIDOR_01}"
PARAMETROS_MOTIVO_07="Comando 02  : ${LINEA_COMANDO_SERVIDOR_02}"
PARAMETROS_MOTIVO_08="Comando 03  : ${LINEA_COMANDO_SERVIDOR_03}"
PARAMETROS_MOTIVO_09="Usuario     : ${USER_STOP_SERVER}"
PARAMETROS_MOTIVO_10="Clave       : ${PASS_STOP_SERVER}"

else

MOTIVO_FUNCION="Codigo Incorrecto en WAS"
PARAMETROS_MOTIVO_01="Codigo : ${ID_WAS}"


#--------========--------========--------========--------========---
#------- [2] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi
else

SALIDA_was_load_parameters_stop_soa_cluster=1

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

INFO_SCRIPT=${INFO_SCRIPT_was_load_parameters_stop_soa_cluster}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_was_load_parameters_stop_soa_cluster}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_was_load_parameters_stop_soa_cluster}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_was_load_parameters_stop_soa_cluster}
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

