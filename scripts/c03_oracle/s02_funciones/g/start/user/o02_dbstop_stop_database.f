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
#-- oracle_stop
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
#E oracle_stop -- Para Oracle 
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

oracle_stop()
{
IS_oracle_stop="Ejecuta comando sql pasado como cadena"
INFO_SCRIPT=${IS_oracle_stop}

INFO_SCRIPT_oracle_stop=${INFO_SCRIPT}

##ORACLE_SID=${1}
CADENA_STOP_DB=${1}
CONEXION_BD=${1}

SALIDA_oracle_stop=0

NOMBRE_SCRIPT_oracle_stop=oracle_stop
PARAMETROS_SCRIPT_oracle_stop="[CADENA_BD] [CONEXION]"


if [ "${CADENA_STOP_DB}" == "" ]; then
CADENA_STOP_DB="shutdown immediate;:quit;"
fi  

if [ "${CONEXION_BD}" == "" ]; then
CONEXION_BD=" / as sysdba"
fi  

if [ "${FICHERO_ORATAB}" == "" ]; then
FICHERO_ORATAB=/etc/oratab
fi  

if [ "${CADENA_STOP_DB}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_oracle_stop} ${PARAMETROS_SCRIPT_oracle_stop}

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

which lsnrctl &> /dev/null
lsnrctl_ok=$?

if [ "${lsnrctl_ok}" == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Inicio resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

NUM_LINEAS_EN_FICHERO=$(cat ${FICHERO_ORATAB} | grep -v "^#" | wc -l )

if [ "${NUM_LINEAS_EN_FICHERO}" != "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio proceso fichero oratab
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

ORACLE_SID_OLD=${ORACLE_SID}
SIDS=

for linea_oracle in $(cat ${FICHERO_ORATAB} | grep -v "^#") ; do

ORACLE_SID=$(echo ${linea_oracle} | cut -d ":" -f1)
echo "SID a parar : ${ORACLE_SID}"

posiciona "Oracle-Parando SID ${ORACLE_SID}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
run_sql "${CADENA_STOP_DB}" "${CONEXION_BD}"	&> /dev/null
SALIDA_oracle_stop=${SALIDA_run_sql}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SIDS="${ORACLE_SID} - ${SIDS}"

done

ORACLE_SID=${ORACLE_SID_OLD}

echo "Sale del FOR SID anterior : ${ORACLE_SID}"


PARAMETROS_MOTIVO_01="ORACLE SIDs       : ${SIDS}  "
PARAMETROS_MOTIVO_02="Conexion          : ${CONEXION_BD} "
PARAMETROS_MOTIVO_03="Cadena            : ${CADENA_STOP_DB}   "

if [ "${SALIDA_run_sql}"  == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Inicio proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

# Stop Listener
lsnrctl stop	&> /dev/null
salida_lsnrctl=$?
if [ "${salida_lsnrctl}" == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [4] Inicio proceso salida lsnrctl
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

MOTIVO_FUNCION="Proceso correcto"

else
MOTIVO_FUNCION="Fallo al intentar para el listener"
SALIDA_oracle_stop=2
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [4] Fin proceso salida lsnrctl
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Proceso erroneo - Fallo al lanzar run_sql"
SALIDA_oracle_stop=3
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [3] Fin proceso resultado oracle_parser
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Configuración incorrecta en oratab o entorno no preparado para BBDD"
SALIDA_oracle_stop=4
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin proceso fichero oratab
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else
MOTIVO_FUNCION="Proceso erroneo - Entorno Oracle no cargado. No se localiza lsnrctl"
SALIDA_oracle_stop=5
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [1] Fin resultado listener
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_oracle_stop}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_oracle_stop}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_oracle_stop}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_oracle_stop}
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
