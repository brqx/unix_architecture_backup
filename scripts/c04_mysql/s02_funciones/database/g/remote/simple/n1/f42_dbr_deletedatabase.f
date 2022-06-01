#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
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
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_delete
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Elimina una base de datos remota
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T eliminacion borrado bbdd mysql remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BBDD 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_delete U S 22 za_d50prok  --> Elimina bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbdeld
## - Elimina la BBDD
dbr_delete()
{
IS_dbr_delete="Elimina la base de datos remota"
INFO_SCRIPT=${IS_dbr_delete}

INFO_SCRIPT_dbr_delete=${INFO_SCRIPT}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3
BASE_DATOS=$4

SALIDA_dbr_delete=0

NOMBRE_SCRIPT_dbr_delete=dbr_delete
PARAMETROS_SCRIPT_dbr_delete="USER SERVER PORT BD_LOCAL BD_REMOTA [RUTA_EXPORT] [RUTA_IMPORT]"

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BASE_DATOS}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_delete} ${PARAMETROS_SCRIPT_dbr_delete}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Que pasa si el usuario tiene un guion bajo

BASE_DATOS_SIN_GUION=$( echo ${BASE_DATOS}  | tr "_" "-" )

CADENA_SQL_INICIAL="DROP DATABASE ${BASE_DATOS_SIN_GUION}; flush privileges;"

CADENA_SQL=$( echo ${CADENA_SQL_INICIAL}  | tr " " "_" )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_runmysql ${USUARIO_SERVER} ${SERVER} ${PUERTO} ${CADENA_SQL}
SALIDA_dbr_delete=${SALIDA_dbr_runmysql}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_runmysql}" == "0"  ]  ; then
#-Copia correcta
MOTIVO_FUNCION="BD borrada correctamente"
else
MOTIVO_FUNCION="Hay problemas al borrar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Consulta   : ${CADENA_SQL}"
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbr_delete}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_delete}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_delete}

e_pms

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_dbr_delete}
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
