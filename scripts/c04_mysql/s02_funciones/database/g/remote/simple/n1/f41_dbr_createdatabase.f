#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="general"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_create
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Crea una base de datos remota
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion bbdd mysql remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BBDD 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_create U S 22 za_d50prok  --> Genera bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbrcrea
## - Genera la BBDD
dbr_create()
{
IS_dbr_create="Crea la base de datos remota"
INFO_SCRIPT=${IS_dbr_create}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_dbr_create=${INFO_SCRIPT}

USUARIO_SERVER=$1
SERVER=$2
PUERTO_SERVER=$3
BASE_DATOS=$4

SALIDA_dbr_create=0

NOMBRE_SCRIPT_dbr_create=dbr_create
PARAMETROS_SCRIPT_dbr_create="USER SERVIDOR PUERTO BASE_DATOS"

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BASE_DATOS}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_create} ${PARAMETROS_SCRIPT_dbr_create}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Que pasa si el usuario tiene un guion bajo

BASE_DATOS_SIN_GUION=$( echo ${BASE_DATOS}  | tr "_" "-" )

CADENA_SQL_INICIAL_CREATE="CREATE DATABASE ${BASE_DATOS_SIN_GUION}; flush privileges;"

CADENA_SQL_CREATE=$( echo ${CADENA_SQL_INICIAL_CREATE}  | tr " " "_" )

#-Antes de invocar indicamos que venimos desde nivel superior

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_runmysql ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${CADENA_SQL_CREATE}
SALIDA_dbr_create=${SALIDA_dbr_runmysql}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_create}" == "0"  ]  ; then
MOTIVO_FUNCION="BD creada correctamente"
PARAMETROS_MOTIVO_01="${CADENA_SQL_CREATE}"
else
MOTIVO_FUNCION="Hay problemas al crear la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Consulta   : ${CADENA_SQL_CREATE}"
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#-No ha sido llamada - emntonces informamos en este nivel
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbr_create}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_create}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_create}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_dbr_create}

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
