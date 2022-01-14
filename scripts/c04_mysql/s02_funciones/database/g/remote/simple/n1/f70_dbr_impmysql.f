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
#-- dbr_impmysql
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - e_pms
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I importa una consulta BBDD mysql en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T importacion consulta bbdd mysql remote remota
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO SERVIDOR PUERTO CONSULTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_impmysql brqx_za  --> Genera usuario brqx_za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Vamos a habilitar que se pueda importar en otra BD

## - Se encarga de ir al portal correspondiente considerando la ruta actual
dbr_impmysql()
{
IS_dbr_impmysql="Importa la base de datos en la Base de datos Mysql"
INFO_SCRIPT=${IS_dbr_impmysql}

INFO_SCRIPT_dbr_impmysql=${INFO_SCRIPT}

USUARIO_SERVER=$1
SERVER=$2
PUERTO_SERVER=$3
BBDD_GUION_MEDIO=$4
RUTA_IMPORT=$5

SALIDA_dbr_impmysql=0

NOMBRE_SCRIPT_dbr_impmysql=dbr_impmysql
PARAMETROS_SCRIPT_dbr_impmysql="usuario servidor puerto consulta"


if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BBDD_GUION_MEDIO}" == "" ] ; then
USUARIO_SERVER="-?"
fi

#-Si no se indica ruta import hay que componerla
if [ "${RUTA_IMPORT}" == "" ] ; then
RUTA_IMPORT=${DB_GLOBAL_IMPORT}${BBDD_GUION_MEDIO}.sql
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_runmysql} ${PARAMETROS_SCRIPT_dbr_runmysql}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Habria que comprobar que existe BBDD y directorio
#-Claro que es una comprobacion remota - falta crear las funciones


CADENA_MYSQL_IMPORT="mysql -u root ${BBDD_GUION_MEDIO} < ${RUTA_IMPORT} "

ssh -oPort=${PUERTO_SERVER} ${USUARIO_SERVER}@${SERVER} ${CADENA_MYSQL_IMPORT}
ERROR_ssh=$?
SALIDA_dbr_impmysql=${ERROR_ssh}


if [ "${ERROR_ssh}" == "0"  ]  ; then
MOTIVO_FUNCION="Importacion correcta"

else
MOTIVO_FUNCION="Hay problemas con el usuario en la consulta "
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} "
PARAMETROS_MOTIVO_02="Consulta   : ${CONSULTA} "
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-No ha sido llamada - emntonces informamos en este nivel

INFO_SCRIPT=${INFO_SCRIPT_dbr_impmysql}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_impmysql}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_impmysql}

e_pms 

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
