#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cleandb_mysql_drupal_tables
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_cache_clear
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Limpieza de logs y caches de tablas en base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T database clean cache table logs drupal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FICHERO_RECURSOS_BBDD]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cleandb_mysql_drupal_tables  	-- Vaciado de la cache de las tablas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Limpia la cache de drupal de todas las BBDD
cleandb_mysql_drupal_tables()
{
IS_cleandb_mysql_drupal_tables="Limpia BBDD Drupal. Caches y watchdog."
INFO_SCRIPT=${IS_cleandb_mysql_drupal_tables}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cleandb_mysql_drupal_tables=${INFO_SCRIPT}

FICHERO_RECURSOS_BBDD=${1}

SALIDA_cleandb_mysql_drupal_tables=0

NOMBRE_SCRIPT_cleandb_mysql_drupal_tables=cleandb_mysql_drupal_tables
PARAMETROS_SCRIPT_cleandb_mysql_drupal_tables="[FICHERO_RECURSOS_BBDD]"

NOMBRE_PANTALLA_cleandb_mysql=PANTALLA_cleandb_mysql.dat

if [ "${FICHERO_RECURSOS_BBDD}" == "" ]; then
FICHERO_RECURSOS_BBDD=${RECSERVS}server/zbbdd_servidor.dat
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_RECURSOS_BBDD}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_cleandb_mysql_drupal_tables} ${PARAMETROS_SCRIPT_cleandb_mysql_drupal_tables}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar las BBDD a limpiar
#-- [2] Vaciar logs de BBDD
#--------========--------========--------========--------========---

stat "${FICHERO_RECURSOS_BBDD}" &> /dev/null
EXISTE_FICHERO=$?

if [ "${EXISTE_FICHERO}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion fichero recursos
#----====----====----====----====----====----====----====----====---

which php > /dev/null
SALIDA_php=$?

NUM_BBDD=$( cat ${FICHERO_RECURSOS_BBDD} | grep -v "^#" | wc -l )

PARAMETROS_MOTIVO_01="Fichero BBDD    : ${FICHERO_RECURSOS_BBDD}"
PARAMETROS_MOTIVO_02="Numero BBDDs    : ${NUM_BBDD}"


if [ "${SALIDA_php}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio comprobacion php en sistema
#------======------======------======------======------======------=

#-Hay que mirar la salida del touch
touch ${NOMBRE_PANTALLA_cleandb_mysql}

for i in $(cat ${FICHERO_RECURSOS_BBDD} | grep -v "^#" ) ; do
USUARIO_DB=$(echo $i | cut -d ":" -f1)
CADENA_BD=$(echo $i | cut -d ":" -f2)

##Aqui falta mirar la version de drupal

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_cache_clear ${USUARIO_DB}_${CADENA_BD}
SALIDA_cleandb_mysql_drupal_tables=$(expr ${SALIDA_db_cache_clear} + ${SALIDA_cleandb_mysql_drupal_tables} )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

echo "${USUARIO_DB}_${CADENA_BD} : ${SALIDA_db_cache_clear}"


if [ "${SALIDA_db_cache_clear}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [3] Inicio comprobacion salida db_cache_clear
#--------========--------========--------========--------========---
cat ${NOMBRE_PANTALLA_clear_database} >> "${NOMBRE_PANTALLA_cleandb_mysql}"

#--------========--------========--------========--------========---
#----- [3] Fin comprobacion salida db_cache_clear
#--------========--------========--------========--------========---
fi

done

#-Borramos la pantall
rm -f ${NOMBRE_PANTALLA_clear_database} &> /dev/null

PANTALLA_SCRIPT="${NOMBRE_PANTALLA_clean_mysql}"

if [ "${SALIDA_cleandb_mysql_drupal_tables}" == "0" ] ; then
#----------==========----------==========----------==========-------
#----- [3] Inicio comprobacion salida db_cache_clear
#----------==========----------==========----------==========-------
MOTIVO_FUNCION="Todas las BBDD han sido vaciadas correctamente"

else
MOTIVO_FUNCION="Alguna BBDD no ha sido vaciada correctamente: ${SALIDA_cleandb_mysql_drupal_tables} "
#----------==========----------==========----------==========-------
#----- [3] Inicio comprobacion salida db_cache_clear
#----------==========----------==========----------==========-------
fi

else

MOTIVO_FUNCION="No esta disponible el comando php para efecturar el reemplazo"
SALIDA_cleandb_mysql_drupal_tables=7
#------======------======------======------======------======------=
#----- [2] Fin comprobacion php en sistema
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="No esta accesible el fichero de bases de datos"
SALIDA_cleandb_mysql_drupal_tables=9
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion fichero recursos
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cleandb_mysql_drupal_tables}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cleandb_mysql_drupal_tables}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cleandb_mysql_drupal_tables}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_cleandb_mysql_drupal_tables}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

