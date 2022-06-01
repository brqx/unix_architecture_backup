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
#-- oracle_su_pass_start
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
#E oracle_su_pass_start script pendient  -- Lanza la consulta SQL
#-------------------------------------------------------------------
#E oracle_su_pass_start -- Arranca Oracle 
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

oracle_su_pass_start()
{
IS_oracle_su_pass_start="Inicia listener y engine de una BBDD Oracle"
INFO_SCRIPT=${IS_oracle_su_pass_start}

INFO_SCRIPT_oracle_su_pass_start=${INFO_SCRIPT}

ID_WAS=${1}
ORACLE_SID=${2}
CADENA_START_DB=${3}
CONEXION_BD=${4}

SALIDA_oracle_su_pass_start=0

NOMBRE_SCRIPT_oracle_su_pass_start=oracle_su_pass_start
PARAMETROS_SCRIPT_oracle_su_pass_start="[CADENA_BD] [CONEXION]"

if [ "${ID_WAS}" == "" ]; then
ID_WAS="-?"
fi


if [ "${ORACLE_SID}" == "" ]; then
ORACLE_SID=arq1
fi

if [ "${CADENA_START_DB}" == "" ]; then
CADENA_START_DB="startup;quit;"
fi  

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD=" / as sysdba"
fi  


if [ "${ID_WAS}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_oracle_su_pass_start} ${PARAMETROS_SCRIPT_oracle_su_pass_start}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar conexion
#-- [2] Iniciar Listener
#-- [3] Iniciar BBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters ${ID_WAS}
SALIDA_oracle_su_pass_start=${SALIDA_was_load_parameters}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_was_load_parameters}" == "0" ] ; then
#---===---===---===---===---===---===---===---===---===---===---===-
#----- [1] Carga de datos contra el WAS indicado
#---===---===---===---===---===---===---===---===---===---===---===-

COMANDO_SU_PASS_STATUS='su - oracle -c "which lsnrctl"'

##-Desde root : su - oracle -c "which lsnrctl"
##-Desde ibm  : echo "ibm" | sudo -S su - oracle -c "lsnrctl status"
echo ${USUARIO_CONEXION} | sudo -S ${COMANDO_SU_PASS_STATUS} &> /dev/null
lsnrctl_ok=$?

if [ $lsnrctl_ok -eq 0] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

COMANDO_SU_PASS_START='su - oracle -c "lsnrctl start"'

# Start Listener
echo ${USUARIO_CONEXION} | sudo -S ${COMANDO_SU_PASS_START} &> /dev/null

run_su_pass_sql ${CADENA_START_DB} ${CONEXION_BD} 
SALIDA_oracle_su_pass_start=${SALIDA_run_su_pass_sql}

if [ "${SALIDA_run_su_pass_sql}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Inicio proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

PARAMETROS_MOTIVO_01="ORACLE SID        : ${ORACLE_SID}  "
PARAMETROS_MOTIVO_02="Conexion          : ${CONEXION_BD} "
PARAMETROS_MOTIVO_03="Cadena            : ${CADENA_START_DB}   "

MOTIVO_FUNCION="Proceso correcto"

else
MOTIVO_FUNCION="Proceso erroneo - Fallo al lanzar run_sql"

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Fin proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza lsnrctl"
SALIDA_oracle_su_pass_start=5
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Proceso erroneo - Servidor no identificado"
SALIDA_oracle_su_pass_start=6
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Fin resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_oracle_su_pass_start}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_oracle_su_pass_start}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_oracle_su_pass_start}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_oracle_su_pass_start}
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
