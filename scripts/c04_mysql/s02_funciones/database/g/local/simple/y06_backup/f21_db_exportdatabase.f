#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_export
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Exporta una base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T exportacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD_LOCAL [BBDD_REMOTA] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_export za_d50prok  --> Exporta bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#alias dbexp
##- Exporta la base de datos actual y prepara el fichero de importacion remoto
db_export()
{
IS_db_export="Exporta la base de datos indicada"
INFO_SCRIPT=${IS_db_export}

INFO_SCRIPT_db_export=${INFO_SCRIPT}

BASE_DATOS_LOCAL=$1
BASE_DATOS_REMOTA=$2
RUTA_EXPORT=$3

SALIDA_db_export=0

NOMBRE_SCRIPT_db_export=db_export
PARAMETROS_SCRIPT_db_export="BD_LOCAL BD_REMOTA RUTA_EXPORT"

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${BASE_DATOS_REMOTA}" == "" ] ; then
BASE_DATOS_REMOTA=${BASE_DATOS_LOCAL}
fi

if [ "${RUTA_EXPORT}" == "" ] ; then
#-Si no se indica ruta - vamos a establecer una ruta comun
RUTA_EXPORT=${DB_GLOBAL_EXPORT}
fi

if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_export} ${PARAMETROS_SCRIPT_db_export}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Exportar base de datos ( si la ruta no existe, debe crearla )

if [ ! -d "${RUTA_EXPORT}" ] ; then
#-Aqui en teoria nunca va a entrar - solo la primera vez que la ruta no exista
mkdir -p ${RUTA_EXPORT}
fi

##mysqldump --single-transaction --quick -e $i > $i.sql
mysqldump -u root ${BASE_DATOS_LOCAL} > ${RUTA_EXPORT}${BASE_DATOS_REMOTA}.sql
SALIDA_MYSQL=$?

SALIDA_db_export=${SALIDA_MYSQL}

md5sum ${RUTA_EXPORT}${BASE_DATOS_REMOTA}.sql > ${RUTA_EXPORT}${BASE_DATOS_REMOTA}.sql.md5

PARAMETROS_MOTIVO_01="Base de datos    : ${BASE_DATOS_REMOTA}"
PARAMETROS_MOTIVO_02="Ruta Exportacion : ${RUTA_EXPORT}"


if [ "${SALIDA_MYSQL}" == "0"  ]  ; then
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Inicio salida mysql
#-----====-----====-----====-----====-----====-----====-----====----

MOTIVO_FUNCION="BD exportada correctamente"
else
MOTIVO_FUNCION="Error al exportar BD (no existe o hay un problema)"

#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Fin salida mysql
#-----====-----====-----====-----====-----====-----====-----====----
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_export}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_export}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_export}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_db_export}
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
