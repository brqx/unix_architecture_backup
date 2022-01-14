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
#-- xsql
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - 
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
#P [usuario] [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E xsql script pendient  -- Lanza la consulta SQL
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- cat prueba_con01.sql | sqlplus /nolog


xsql()
{
IS_xsql="Ejecuta comando sql"
INFO_SCRIPT=${IS_xsql}

INFO_SCRIPT_xsql=${INFO_SCRIPT}

CONEXION_BD=${1}
SCRIPT_BD=${2}

SALIDA_xsql=0

NOMBRE_SCRIPT_xsql=xsql
PARAMETROS_SCRIPT_xsql="PARAMETROS_SQL [CONEXION]"

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD="cosym/cosym"
fi  

if [ "${FILTRO_LOGS}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_carga_logs_mapfre} ${PARAMETROS_SCRIPT_carga_logs_mapfre}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar entorno
#-- [2] Procesar los ficheros temporalmente y eliminarlos
#-- [3] Cargar todos los fichero preprocesados en BD
#--------========--------========--------========--------========---

#--------========--------========--------========--------========---
# running Oracle 8 (or above) on a Unix platform:
#-------------------------------------------------------------------
#-- 0 = Successful
#-- 1 = Unrecoverable failure
#-- 2 = At least one row rejected
#-- 3 = O/S Errors
#--------========--------========--------========--------========---

which sqlplus > /dev/null
sqlplus_ok=$?

#-Preproceso de parametros

#-Debe existir el procesador SQL

if [ "${sqlplus_ok}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio ordenes sql disponibles
#----====----====----====----====----====----====----====----====---

## export ORACLE_SID=arq1

# Start Listener
## lsnrctl start

# Start Database
## sqlplus / as sysdba << EOF
## STARTUP;
## EXIT;

sqlplus ${CONEXION_BD} @${SCRIPT_BD}
salida_sqlplus=$?

SALIDA_carga_logs_mapfre=${salida_sqlplus}

if [ ${salida_sqlplus} -eq 0  ] ; then
#---------=========---------=========---------=========---------====
#--------- [3] Inicio proceso resultado sqlplus
#---------=========---------=========---------=========---------====
	MOTIVO_FUNCION="Proceso correcto"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "
	PARAMETROS_MOTIVO_04="Fichero log       : ${file}         "

else
	MOTIVO_FUNCION="Proceso erroneo - Fallo al cargar los datos"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "
	PARAMETROS_MOTIVO_04="Fichero log       : ${file}         "
#---------=========---------=========---------=========---------====
#--------- [3] Fin proceso resultado sqlplus
#---------=========---------=========---------=========---------====
fi
else
	MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza sqlplus"
	PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD} "
	PARAMETROS_MOTIVO_02="Script Consulta BD: ${SCRIPT_BD}   "
	PARAMETROS_MOTIVO_03="Script Control BD : ${CONTROL_BD}   "

	SALIDA_carga_logs_mapfre=5

#----====----====----====----====----====----====----====----====---
#----- [1] Fin ordenes sql disponibles
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_xsql}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_xsql}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_xsql}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_xsql}
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
