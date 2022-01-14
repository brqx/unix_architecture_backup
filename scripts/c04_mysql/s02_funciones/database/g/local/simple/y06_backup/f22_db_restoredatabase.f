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
#-- db_restore
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_impmysql - e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Importa una base de datos. La BBDD debe estar creada
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
#E db_restore za_d50prok  --> Importa bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de recuperar la base de datos corresopndiente que se ha pasado
##   utiliza un fichero sql que se llama exactamente igual que el nombre de la bd

#-Vamos a preparar una funcion que permita importar un nombre distinto
##- Alias db_import - dbimp
db_restore()
{
IS_db_restore="Importa la base de datos indicada. La BBDD debe estar creada"
INFO_SCRIPT=${IS_db_restore}

BASE_DATOS_LOCAL=$1
RUTA_IMPORT=$2

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${RUTA_IMPORT}" == "" ] ; then
#-Si no se indica ruta - vamos a usar una ruta generica
RUTA_IMPORT=${DB_GLOBAL_IMPORT}${BASE_DATOS_LOCAL}.sql
fi


if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt db_restore "BASE_DATOS_LOCAL"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

db_impmysql ${BASE_DATOS_LOCAL} ${RUTA_IMPORT}

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

