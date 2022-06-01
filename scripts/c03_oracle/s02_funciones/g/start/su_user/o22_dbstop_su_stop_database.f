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
#-- oracle_su_stop
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - oracle_parser
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
#E oracle_su_stop -- Para Oracle 
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

oracle_su_stop()
{
IS_oracle_su_stop="Ejecuta comando sql pasado como cadena"
INFO_SCRIPT=${IS_oracle_su_stop}

INFO_SCRIPT_oracle_su_stop=${INFO_SCRIPT}

ORACLE_SID=${1}
CADENA_START_DB=${2}
CONEXION_BD=${3}

SALIDA_oracle_su_stop=0

NOMBRE_SCRIPT_oracle_su_stop=oracle_su_stop
PARAMETROS_SCRIPT_oracle_su_stop="[CADENA_BD] [CONEXION]"

if [ "${ORACLE_SID}" == "" ]; then
ORACLE_SID=arq1
fi

if [ "${CADENA_START_DB}" == "" ]; then
CADENA_START_DB="shutdown immediate;quit;"
fi  

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD=" / as sysdba"
fi  


if [ "${ORACLE_SID}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_oracle_su_stop} ${PARAMETROS_SCRIPT_oracle_su_stop}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar conexion
#-- [2] Parar Listener
#-- [3] Parar BBDD
#--------========--------========--------========--------========---

COMANDO_SU_PASS_STATUS='su - oracle -c "which lsnrctl"'

##-Desde root : su - oracle -c "which lsnrctl"
echo ${USUARIO_CONEXION} | ${COMANDO_SU_PASS_STATUS} &> /dev/null
lsnrctl_ok=$?

if [ $lsnrctl_ok -eq 0] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Inicio resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

COMANDO_SU_PASS_STOP='su - oracle -c "lsnrctl stop"'

# Start Listener
${COMANDO_SU_PASS_STOP} &> /dev/null

run_su_sql ${CADENA_STOP_DB} ${CONEXION_BD}
SALIDA_oracle_su_stop=${SALIDA_run_su_sql}

if [ "${SALIDA_run_su_sql}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

PARAMETROS_MOTIVO_01="ORACLE SID        : ${ORACLE_SID}  "
PARAMETROS_MOTIVO_02="Conexion          : ${CONEXION_BD} "
PARAMETROS_MOTIVO_03="Cadena            : ${CADENA_STOP_DB}   "

MOTIVO_FUNCION="Proceso correcto"

else
MOTIVO_FUNCION="Proceso erroneo - Fallo al lanzar run_sql"
SALIDA_oracle_su_stop=4
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza lsnrctl"
SALIDA_oracle_su_stop=5
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Fin resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_oracle_su_stop}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_oracle_su_stop}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_oracle_su_stop}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_oracle_su_stop}
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
