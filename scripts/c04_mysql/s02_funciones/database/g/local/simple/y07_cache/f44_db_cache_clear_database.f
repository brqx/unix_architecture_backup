#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
STATUS_SCRIPT="development"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="database"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_cache_clear
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una limpieza de las bbdd de cache y log
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T bbdd string clear clean cache
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ENTORNO VARIANTE PROYECTO [VERSION] | BBDD [VERSION]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_cache_clear za d50 abrqx   	-- Limpia la cache y los logs de BD
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Hace un reenplazo en la BBDD

db_cache_clear()
{
IS_db_cache_clear="Hace una limpieza de las bbdd de cache y log"
INFO_SCRIPT=${IS_db_cache_clear}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_cache_clear=${INFO_SCRIPT}

ENTORNO_DB=${1}
VARIANTE_DB=${2}
PROYECTO_DB=${3}

SALIDA_db_cache_clear=0

NOMBRE_SCRIPT_db_cache_clear=db_cache_clear
PARAMETROS_SCRIPT_db_cache_clear="ENTORNO VARIANTE PROYECTO [VERSION] | BBDD [VERSION]"

NOMBRE_PANTALLA_clear_database=PANTALLA_clear_database.dat

if [ "${ENTORNO_DB}" == "" ]; then
ENTORNO_DB="-?"
fi

if [ "${ENTORNO_DB}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_db_cache_clear} ${PARAMETROS_SCRIPT_db_cache_clear}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar parametros
#-- [2] Reemplazar cadena en base de datos
#--------========--------========--------========--------========---

echo "${ENTORNO_DB}" | grep "_" &> /dev/null
SALIDA_bbdd_completa=$?

if [ "${SALIDA_bbdd_completa}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio test BBDD completa
#------======------======------======------======------======------=
BBDD_COMPLETA=${ENTORNO_DB}

ENTORNO_DB=$(echo ${BBDD_COMPLETA} | cut -d "_" -f1)
RESTO_CADENA_DB=$(echo ${BBDD_COMPLETA} | cut -d "_" -f2-)
VERSION_DB=$(echo ${RESTO_CADENA_DB} | cut -c2-3) 
VARIANTE_DB=$(echo ${RESTO_CADENA_DB} | cut -c1-3) 
PROYECTO_DB=$(echo ${RESTO_CADENA_DB} | cut -c4-)  

else
#- BBDD no esta completa
BBDD_COMPLETA=${ENTORNO_DB}_${VARIANTE_DB}${PROYECTO_DB}

VERSION_DB=$(echo ${VARIANTE_DB} | cut -c2-3) 

#------======------======------======------======------======------=
#----- [1] Fin test BBDD completa
#------======------======------======------======------======------=
fi

which php > /dev/null
SALIDA_php=$?

if [ "${SALIDA_php}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion php en sistema
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

db_exist ${BBDD_COMPLETA}
SALIDA_db_cache_clear=${SALIDA_db_exist}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Base de datos        : ${BBDD_COMPLETA}"
PARAMETROS_MOTIVO_02="Entorno              : ${ENTORNO_DB}"
PARAMETROS_MOTIVO_03="Variante             : ${VARIANTE_DB}"
PARAMETROS_MOTIVO_04="Proyecto             : ${PROYECTO_DB}"
PARAMETROS_MOTIVO_05="Version Drupal       : ${VERSION_DB}"


if [ "${SALIDA_db_exist}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio existencia BBDD en sistema
#------======------======------======------======------======------=

php -f ${LIBRERIAS_PHP}/mysql/clear/cache_clear_database_v${VERSION_DB}.php \
$ENTORNO_DB $VARIANTE_DB $PROYECTO_DB \
&> ${NOMBRE_PANTALLA_clear_database}
SALIDA_php=$?

PANTALLA_SCRIPT="${NOMBRE_PANTALLA_clear_database}"
MOTIVO_FUNCION="BD limpiada y reemplazo efectuado -- ${SALIDA_php}"

else

MOTIVO_FUNCION="BD no existe en el sistema"

#------======------======------======------======------======------=
#----- [2] Fin existencia BBDD en sistema
#------======------======------======------======------======------=
fi
else
#- No se le pasa usuario

MOTIVO_FUNCION="No esta disponible el comando php para efecturar el reemplazo"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion php en sistema
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_cache_clear}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_cache_clear}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_cache_clear}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_cache_clear}
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





