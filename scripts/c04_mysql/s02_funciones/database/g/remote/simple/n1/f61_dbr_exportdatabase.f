#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_export
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Exporta una base de datos remota
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T exportacion bbdd mysql remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BBDD_LOCAL [BBDD_REMOTA] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_export U S 22 za_d50prok  --> Exporta bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#alias dbrexp
##- Exporta la base de datos actual y prepara el fichero de importacion remoto
dbr_export()
{
IS_dbr_export="Exporta la base de datos remota en ruta remota"
INFO_SCRIPT=${IS_dbr_export}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3
BASE_DATOS_LOCAL=$4
BASE_DATOS_REMOTA=$5
RUTA_EXPORT=$6

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BASE_DATOS_REMOTA}" == "" ] ; then
BASE_DATOS_REMOTA=${BASE_DATOS_LOCAL}
fi

if [ "${RUTA_EXPORT}" == "" ] ; then
#-Si no se indica ruta 
RUTA_EXPORT=${PWD}
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt dbr_export "USER SERVIDOR PUERTO BD_LOCAL BD_REMOTA RUTA_EXPORT"

else

echo "Exportando bbdd ${BASE_DATOS_REMOTA}"

BASE_DATOS_SIN_GUION=$( echo ${BASE_DATOS}  | tr "_" "-" )

CADENA_SQL=$( echo ${CADENA_SQL_INICIAL}  | tr " " "_" )

dbr_mysqldump ${USUARIO_SERVER} ${SERVER} ${PUERTO} ${BASE_DATOS_SIN_GUION} ${RUTA_EXPORT}

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
