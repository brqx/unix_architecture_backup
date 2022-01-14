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
#-- run_sql
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
#E run_sql script pendient  -- Lanza la consulta SQL
#-------------------------------------------------------------------
#E run_sql "$LINORA" " / as sysdba"  -- Lanza la consulta como sysdba
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- echo "conn cosym/cosym;:select * from dual;:quit" | tr ":" "\n" | sqlplus /nolog
#- cat prueba_con01.sql | sqlplus /nolog

run_sql()
{
IS_run_sql="Ejecuta comando sql pasado como cadena"
INFO_SCRIPT=${IS_run_sql}

INFO_SCRIPT_run_sql=${INFO_SCRIPT}

CADENA_BD_SQL=${1}
CONEXION_BD_SQL=${2}


SALIDA_run_sql=0

NOMBRE_SCRIPT_run_sql=run_sql
PARAMETROS_SCRIPT_run_sql="CONEXION CADENA_BD"

if [ "${CONEXION_BD_SQL}" == "" ]; then
CONEXION_BD_SQL=" /nolog"
fi  

if [ "${CADENA_BD_SQL}" == "" ]; then
CONEXION_BD="-?"
fi  


if [ "${CADENA_BD_SQL}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_run_sql} ${PARAMETROS_SCRIPT_run_sql}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar conexion
#-- [2] Procesar cadena
#-- [3] Lanzar sqlplus con cadena y conesion
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
#-Hay que parar la BBDD antes que el listener

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

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
oracle_parser "${CADENA_BD_SQL}" &> /dev/null
SALIDA_run_sql=${SALIDA_oracle_parser}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_oracle_parser}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

#--SERVER_CHANGE
CADENA_TEST="conn cosym/cosym;:select dummy from dual;"
oracle_parser $CADENA_TEST | sqlplus "${CONEXION_BD}"
salida_sqlplus=$?

if [ "${salida_sqlplus}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Inicio rechequeo entorno correctamente establecido
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
oracle_parser "${CADENA_BD_SQL}" | sqlplus "${CONEXION_BD_SQL}"
salida_sqlplus=$?
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_run_sql=${salida_sqlplus}

PARAMETROS_MOTIVO_01="Conexion          : ${CONEXION_BD_SQL} "
PARAMETROS_MOTIVO_02="Cadena            : ${CADENA_BD_SQL}         "


if [ "${salida_sqlplus}" == "0"  ] ; then
#---------=========---------=========---------=========---------====
#----- [4] Inicio proceso resultado sqlplus
#---------=========---------=========---------=========---------====
	MOTIVO_FUNCION="Proceso correcto"

else
	MOTIVO_FUNCION="Proceso erroneo - Fallo al lanzar comando sql"
	SALIDA_run_sql=3

#---------=========---------=========---------=========---------====
#----- [4] Fin proceso resultado sqlplus
#---------=========---------=========---------=========---------====
fi
else
	MOTIVO_FUNCION="el entorno de Oracle no esta correctamente establecido. Revisar Path."
	SALIDA_run_sql=2

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Fin rechequeo entorno correctamente establecido
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi

else
	MOTIVO_FUNCION="Error al parsear cadena.Fallo en oracle_parser"
	SALIDA_run_sql=4

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
	MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza sqlplus"
	SALIDA_run_sql=5

#----====----====----====----====----====----====----====----====---
#----- [1] Fin ordenes sql disponibles
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_run_sql}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_run_sql}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_run_sql}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_run_sql}
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
