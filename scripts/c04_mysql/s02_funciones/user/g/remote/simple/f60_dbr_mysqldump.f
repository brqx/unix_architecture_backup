#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="general"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="user"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_mysqldump
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza una sentencia de exportacion en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ejecucion exportacion bbdd mysql remote remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO CONSULTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_mysqldump brqx_za  --> Genera usuario brqx_za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de ir al portal correspondiente considerando la ruta actual
dbr_mysqldump()
{
IS_dbr_mysqldump="Lanza la sentencia de exportacion indicada en la Base de datos Mysql remota"
INFO_SCRIPT=${IS_dbr_runmysqldump}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3
BBDD_REMOTA_GUION_MEDIO=$( echo $4 | tr "_" " " )
RUTA_EXPORT=$5


if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO="-?"
fi

if [ "${PUERTO}" == "" ] ; then
PUERTO=22
fi

if [ "${RUTA_EXPORT}" == "" ] ; then
RUTA_EXPORT=$PWD
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt dbr_runmysqldump "usuario servidor puerto base_datos_remota ruta_export"

else

echo "Generando usuario remoto: "
echo "${USUARIO_SERVER} - ${SERVER} - ${PUERTO} == ${CONSULTA}  "

echo "Consulta SQL : ${CONSULTA} "

ssh -oPort=${PUERTO} ${USUARIO_SERVER}@${SERVER} "mysqldump -u root ${BBDD_REMOTA_GUION_MEDIO} > ${RUTA_EXPORT}/${BBDD_REMOTA_GUION_MEDIO}.sql"
SALIDA_MYSQL=$?

if [ "$SALIDA_MYSQL" == "1"  ]  ; then
echo "Hay problemas con el usuario ${USUARIO_SERVER} en la bd ${BBDD_REMOTA_GUION_MEDIO}"
fi

fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
