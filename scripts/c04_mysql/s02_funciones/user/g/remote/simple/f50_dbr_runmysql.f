#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="tested"
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
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pms
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Ejecuta una consulta Mysql en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ejecucion consulta bbdd mysql remote remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO CONSULTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_runmysql U S 22 consulta  --> Ejecuta la consulta en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de ir al portal correspondiente considerando la ruta actual
dbr_runmysql()
{
IS_dbr_runmysql="Crea de forma remota el usuario indicado en la Base de datos Mysql"
INFO_SCRIPT=${IS_dbr_runmysql}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_dbr_runmysql=${INFO_SCRIPT}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3
CONSULTA_GUION_MEDIO=$( echo $4 | tr "_" " " )
CONSULTA=$( echo ${CONSULTA_GUION_MEDIO} | tr "-" "_" )

SALIDA_dbr_runmysql=0

NOMBRE_SCRIPT_dbr_runmysql=dbr_runmysql
PARAMETROS_SCRIPT_dbr_runmysql="usuario servidor puerto consulta"

#-Va a haber una variable global que indicara si hay que devolver resultado a una orden superior

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO="-?"
fi

if [ "${PUERTO}" == "" ] ; then
PUERTO=22
fi

if [ "${CONSULTA}" == "" ] ; then
#-Si no se pasa consulta establecemos una por defecto
CONSULTA="select host, user, password from mysql.user;"
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_runmysql} ${PARAMETROS_SCRIPT_dbr_runmysql}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

ssh -oPort=${PUERTO} ${USUARIO_SERVER}@${SERVER} "mysql -u root -e \"${CONSULTA}\""
ERROR_ssh=$?

SALIDA_dbr_runmysql=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0"  ]  ; then
MOTIVO_FUNCION="Orden procesada correctamente"
PARAMETROS_MOTIVO_01="${CONSULTA}"
else
MOTIVO_FUNCION="Hay problemas con el usuario en la consulta"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} - ${SERVER} - ${PUERTO}"
PARAMETROS_MOTIVO_02="Consulta   : ${USUARIO_SERVER} - ${SERVER} - ${PUERTO}"
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#-No ha sido llamada - emntonces informamos en este nivel
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbr_runmysql}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_runmysql}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_runmysql}

e_pms 

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_dbr_runmysql}

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
