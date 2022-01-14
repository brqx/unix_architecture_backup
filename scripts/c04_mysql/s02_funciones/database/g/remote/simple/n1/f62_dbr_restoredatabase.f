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
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbr_restore
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dbr_runmysql
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Importa una base de datos remota. La BBDD debe estar creada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T importacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbr_restore U S P za_d50prok  --> Importa la bbdd za_d50prok en el servidor remoto
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de recuperar la base de datos corresopndiente que se ha pasado
##   utiliza un fichero sql que se llama exactamente igual que el nombre de la bd

##- Alias dbr_import - dbrimp
dbr_restore()
{
IS_dbr_restore="Importa la base de datos remota. La BBDD debe estar creada"
INFO_SCRIPT=${IS_dbr_restore}

INFO_SCRIPT_dbr_restore=${INFO_SCRIPT}

USUARIO_SERVER=$1
SERVER=$2
PUERTO_SERVER=$3
BASE_DATOS_REMOTA=$4

SALIDA_dbr_restore=0

NOMBRE_SCRIPT_dbr_restore=dbr_restore
PARAMETROS_SCRIPT_dbr_restore="USER SERVIDOR PUERTO BASE_DATOS RUTA_IMPORT_REMOTA"

if [ "${USUARIO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${PUERTO_SERVER}" == "" ] ; then
USUARIO_SERVER="-?"
fi

if [ "${BASE_DATOS_REMOTA}" == "" ] ; then
USUARIO_SERVER="-?"
fi


if [ "${USUARIO_SERVER}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbr_restore} ${PARAMETROS_SCRIPT_dbr_restore}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Si no se indica ruta - entonces debe coger la general
RUTA_IMPORT_REMOTA=${DB_GLOBAL_IMPORT}

RUTA_IMPORT_REMOTA_COMPLETA=${RUTA_IMPORT_REMOTA}${BASE_DATOS_REMOTA}.sql

#-Si no existe el directorio no debe importar

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

dbr_impmysql ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER} ${BASE_DATOS_REMOTA} ${RUTA_IMPORT_REMOTA_COMPLETA}

SALIDA_dbr_restore=${SALIDA_dbr_impmysql}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dbr_impmysql}" == "0"  ]  ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio salida importacion
#----====----====----====----====----====----====----====----====---
#-Copia correcta
MOTIVO_FUNCION="BD restaurada correctamente"

else

MOTIVO_FUNCION="Hay problemas al restaurar la BD"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_SERVER} ${SERVER} ${PUERTO_SERVER}"
PARAMETROS_MOTIVO_02="Consulta   : ${BASE_DATOS_REMOTA} ${RUTA_IMPORT_REMOTA_COMPLETA}"

fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-No ha sido llamada - emntonces informamos en este nivel

INFO_SCRIPT=${INFO_SCRIPT_dbr_restore}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbr_restore}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbr_restore}

e_pms 

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


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

