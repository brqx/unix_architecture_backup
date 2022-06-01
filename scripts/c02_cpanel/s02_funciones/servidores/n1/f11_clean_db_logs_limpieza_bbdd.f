#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servidores"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- clean_db_logs
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- cleandb_mysql_drupal_tables
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
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E clean_db_logs  	-- Inicio seguro completo del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

clean_db_logs()
{
IS_clean_db_logs="Limpia los las tablas de cache y logs de la BBDD"
INFO_SCRIPT=${IS_clean_db_logs}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_clean_db_logs=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_clean_db_logs=0

NOMBRE_SCRIPT_clean_db_logs=clean_db_logs
PARAMETROS_SCRIPT_clean_db_logs="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_clean_db_logs} ${PARAMETROS_SCRIPT_clean_db_logs}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Vaciar logs de BBDD
#--------========--------========--------========--------========---

#-Aqui vaciaremos los logs ya sean de Mysql, Mongodb u otra
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cleandb_mysql_drupal_tables
SALIDA_clean_db_logs=${SALIDA_cleandb_mysql_drupal_tables}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_cleandb_mysql_drupal_tables}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Todas las Bases de datos fueron limpiadas correctamente"

else

MOTIVO_FUNCION="Alguna BBDD ha dado error al limpiarse"

#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_clean_db_logs}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_clean_db_logs}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_clean_db_logs}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_clean_db_logs}
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

