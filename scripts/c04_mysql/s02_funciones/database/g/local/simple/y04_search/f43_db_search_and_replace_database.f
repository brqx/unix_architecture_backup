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
#-- db_replace
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace un reemplazo de cadenas en bbdd. Ideal para cambios de dominios.
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T bbdd string replace multi
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ENTORNO VARIANTE PROYECTO SEARCH REPLACE || BBDD_COMPLETA SEARCH REPLACE
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_replace za d50 abrqx zz.com za.com  	-- Reemplaza en za_d50abrqx zz por za
#-------------------------------------------------------------------
#E db_replace za_d50abrqx zz.com za.com  	-- Reemplaza en za_d50abrqx zz por za
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Hace un reenplazo en la BBDD

db_arq_replace()
{
IS_db_arq_replace="Reemplaza una cadena por otra en base de datos"
INFO_SCRIPT=${IS_db_arq_replace}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_replace=${INFO_SCRIPT}

ENTORNO_DB=$1
VARIANTE_DB=$2
PROYECTO_DB=$3
SEARCH_DB=$4
REPLACE_DB=$5

SALIDA_db_replace=0

NOMBRE_SCRIPT_db_replace=db_replace
PARAMETROS_SCRIPT_db_replace="ENTORNO VARIANTE PROYECTO SEARCH REPLACE || BBDD_COMPLETA SEARCH REPLACE"

NOMBRE_PANTALLA_replace_database=PANTALLA_replace_database.dat

if [ "${ENTORNO_DB}" == "" -o "${VARIANTE_DB}" == "" -o "${PROYECTO_DB}" == "" ]; then
ENTORNO_DB="-?"
fi

if [ "${ENTORNO_DB}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_db_replace} ${PARAMETROS_SCRIPT_db_replace}

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

if [ "${SEARCH_DB}" == "" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio parametros BBDD completa
#------======------======------======------======------======------=
BBDD_COMPLETA=${ENTORNO_DB}
SEARCH_DB=${VARIANTE_DB}
REPLACE_DB=${PROYECTO_DB}
#--
ENTORNO_DB=$(echo ${BBDD_COMPLETA} | cut -d "_" -f1)
RESTO_CADENA_DB=$(echo ${BBDD_COMPLETA} | cut -d "_" -f2-)
VARIANTE_DB=$(echo ${RESTO_CADENA_DB} | cut -c1-3) 
PROYECTO_DB=$(echo ${RESTO_CADENA_DB} | cut -c4-)  

##echo "Variante : ${VARIANTE_DB} "
##echo "Proyecto : ${PROYECTO_DB} "

else

#- Se le pasa usuario - hay que ver si existe la BBDD tambien
BBDD_COMPLETA=${ENTORNO_DB}_${VARIANTE_DB}${PROYECTO_DB}

#------======------======------======------======------======------=
#----- [1] Fin parametros BBDD completa
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

PARAMETROS_MOTIVO_01="Base de datos        : ${BBDD}"

if [ "${SALIDA_db_exist}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio existencia BBDD en sistema
#------======------======------======------======------======------=

MOTIVO_FUNCION="BD limpiada y reemplazo efectuado"
PARAMETROS_MOTIVO_01="Base de datos        : ${ENTORNO}_${VARIANTE}${PROYECTO}"
PARAMETROS_MOTIVO_02="Cadena buscada       : ${SEARCH}"
PARAMETROS_MOTIVO_03="Cadena a reemplazar  : ${REPLACE}"

//php -f ${LIBRERIAS_PHP}/mysql/replace/replace_string_in_db.php

php -v /root/scripts/cache_clear_replace_string_in_db.php \
$ENTORNO_DB $VARIANTE_DB $PROYECTO_DB $SEARCH_DB $REPLACE_DB  \
&> ${NOMBRE_PANTALLA_replace_database}
SALIDA_php=$?

#-No llegan los parametros de vuelta
echo "Salida orden php : ${SALIDA_php} - ${SALIDA_search_string_in_db_php}  "

if [ "${SALIDA_php}" != "0" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio se ha encontrado alguna ocurrencia
#------======------======------======------======------======------=
MOTIVO_FUNCION="Se ha lanzado la orden de busqueda con"
PARAMETROS_MOTIVO_02="Cadena reemplazada     : ${SEARCH_DB}"

PANTALLA_SCRIPT="${NOMBRE_PANTALLA_replace_database}"

else

MOTIVO_FUNCION="Se ha lanzado la orden de busqueda sin exito"
PARAMETROS_MOTIVO_02="Cadena buscada        : ${SEARCH_DB}"

#------======------======------======------======------======------=
#----- [3] Inicio se ha encontrado alguna ocurrencia
#------======------======------======------======------======------=
fi


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

INFO_SCRIPT=${INFO_SCRIPT_db_replace}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_replace}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_replace}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_replace}
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





