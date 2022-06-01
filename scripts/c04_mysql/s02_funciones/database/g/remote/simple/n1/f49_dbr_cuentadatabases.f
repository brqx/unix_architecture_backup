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
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_count
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cuenta las bases de datos del servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cuenta contador bbdd mysql remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO BD
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_count U S 22       --> Cuenta las bases de datos del servidor remoto
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## alias dbcount
dbr_count()
{
IS_dbr_count="Cuenta las base de datos del sistema remoto"
INFO_SCRIPT=${IS_dbr_count}

USUARIO_SERVER=$1
SERVER=$2
PUERTO=$3

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO}" == "" ] ; then
USUARIO_SERVER="-?"
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt dbr_count "USER SERVIDOR PUERTO BASE_DATOS"

else

#- Debemos tratar un listado como el siguiente
## Listado BBDD del servidor
##  Database           |
##  information_schema |
##  mysql              |
##  za_d70cards        |
##  za_d70cars         |
##  zi_d60units        |

NUM_BBDD=$(dbr_list ${USUARIO_SERVER} ${SERVER} ${PUERTO} | wc -l)
SALIDA_MYSQL=$?

#- Para saber el numero de BBDD le restamos 2 , pero como en mysql 
#  siempre van a existir las  otras dos restaremos 4

let NUM_PRACTICO_BBDD=${NUM_BBDD}-4

if [ "${SALIDA_MYSQL}" == "1"  ]  ; then
echo "Error accediendo al servidor de BD"
else
echo "El servidor tiene ${NUM_PRACTICO_BBDD} bases de datos"
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
