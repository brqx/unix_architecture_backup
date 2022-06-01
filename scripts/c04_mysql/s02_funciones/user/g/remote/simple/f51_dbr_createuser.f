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
#-- dbr_user_create
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea un usuario para la base de datos remota
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion usuario bbdd mysql remote remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO_SERVER SERVIDOR PUERTO USUARIO_DB [CLAVE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_user_create U S 22 brqx_za  --> Genera usuario brqx_za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de ir al portal correspondiente considerando la ruta actual
dbr_user_create()
{
IS_dbr_user_create="Crea de forma remota el usuario indicado en la Base de datos Mysql"
INFO_SCRIPT=${IS_dbr_user_create}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3
USUARIO_DB=$4
CLAVE=$5

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${USUARIO_DB}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${CLAVE}" == "" ] ; then
CLAVE="ricardo"
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt dbr_user_create "usuario [clave]"

else

#- Que pasa si el usuario tiene un guion bajo

USUARIO_SIN_GUION=$( echo ${USUARIO_DB}  | tr "_" "-" )

CADENA_SQL_INICIAL="CREATE USER '${USUARIO_SIN_GUION}'@'localhost' IDENTIFIED BY '${CLAVE}' ; flush privileges;"

CADENA_SQL=$( echo ${CADENA_SQL_INICIAL}  | tr " " "_" )

##echo "SQL : ${CADENA_SQL} "

#-Necesitamos lo siguiente
## dbr_runmysql  ricabel localhost 22 
## "CREATE USER 'zg_brqx'@'localhost' IDENTIFIED BY 'ricardo' ; flush privileges;"


dbr_runmysql ${USUARIO_SERVER} ${SERVER} ${PUERTO} ${CADENA_SQL}

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
