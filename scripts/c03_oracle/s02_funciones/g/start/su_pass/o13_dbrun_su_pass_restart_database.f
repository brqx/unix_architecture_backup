#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="oracle"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- oracle_restart
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - oracle_start - oracle_stop
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Ejecuta comandos sql pasados como parametros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T run sql commands
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CONEXION CADENA_BD
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E oracle_restart script pendient  -- Lanza la consulta SQL
#-------------------------------------------------------------------
#E oracle_restart -- Arranca Oracle 
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

oracle_restart()
{
IS_oracle_restart="Inicia listener y engine de una BBDD Oracle"
INFO_SCRIPT=${IS_oracle_restart}

INFO_SCRIPT_oracle_restart=${INFO_SCRIPT}

ORACLE_SID=${1}
CONEXION_BD=${2}
CADENA_START_DB=${3}
CADENA_STOP_DB=${4}

SALIDA_oracle_restart=0

NOMBRE_SCRIPT_oracle_restart=oracle_restart
PARAMETROS_SCRIPT_oracle_restart="[CADENA_BD] [CONEXION]"

if [ "${ORACLE_SID}" == "" ]; then
ORACLE_SID=arq1
fi

if [ "${CADENA_START_DB}" == "" ]; then
CADENA_START_DB="startup;quit;"
fi  

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD=" / as sysdba"
fi  


if [ "${CADENA_BD}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_oracle_restart} ${PARAMETROS_SCRIPT_oracle_restart}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parar BBDD y Listener
#-- [2] Iniciar Listener
#-- [3] Iniciar BBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
oracle_stop ${ORACLE_SID} ${CADENA_START_DB} ${CONEXION_BD} 
SALIDA_oracle_restart=${SALIDA_oracle_stop}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="ORACLE SID        : ${ORACLE_SID}  "
PARAMETROS_MOTIVO_02="Conexion          : ${CONEXION_BD} "
PARAMETROS_MOTIVO_03="Cadena Stop       : ${CADENA_STOP_DB}   "

if [ "${SALIDA_oracle_stop}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Inicio proceso resultado oracle_stop
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
oracle_start ${ORACLE_SID} ${CADENA_STOP_DB} ${CONEXION_BD} 
SALIDA_oracle_restart=${SALIDA_oracle_start}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


PARAMETROS_MOTIVO_01="ORACLE SID        : ${ORACLE_SID}  "
PARAMETROS_MOTIVO_02="Conexion          : ${CONEXION_BD} "
PARAMETROS_MOTIVO_03="Cadena Stop       : ${CADENA_STOP_DB}   "
PARAMETROS_MOTIVO_04="Cadena Start      : ${CADENA_START_DB}   "


if [ "${SALIDA_oracle_start}"  == "0" ] ; then
#-------=======-------=======-------=======-------=======-------====
#----- [2] Inicio proceso resultado oracle_stop
#-------=======-------=======-------=======-------=======-------====

MOTIVO_FUNCION="Proceso correcto"

else
MOTIVO_FUNCION="Error al iniciar Oracle"
SALIDA_oracle_restart=1
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Error al detener Oracle"
SALIDA_oracle_restart=2
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Fin resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_oracle_restart}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_oracle_restart}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_oracle_restart}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_oracle_restart}
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
