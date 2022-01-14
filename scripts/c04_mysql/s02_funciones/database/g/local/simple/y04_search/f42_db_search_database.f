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
#-- db_search 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una busqueda de cadenas en bbdd. 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T bbdd string search multi
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ENTORNO VARIANTE PROYECTO SEARCH
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_search za d50 abrqx zz.com   	-- Busca en za_d50abrqx la cadena zz.com
#-------------------------------------------------------------------
#E db_search za_d50_abrqx zz.com   	-- Busca en za_d50abrqx la cadena zz.com
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Hace un reenplazo en la BBDD

db_search()
{
IS_db_search="Busca una cadena en la base de datos indicada"
INFO_SCRIPT=${IS_db_search}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_search=${INFO_SCRIPT}

ENTORNO_DB=$1
VARIANTE_DB=$2
PROYECTO_DB=$3
SEARCH_DB=$4

SALIDA_db_search=0

NOMBRE_SCRIPT_db_search=db_search
PARAMETROS_SCRIPT_db_search="ENTORNO VARIANTE PROYECTO SEARCH || BBDD SEARCH"

NOMBRE_PANTALLA_search_database=PANTALLA_search_database.dat

#-Obligamos que pase dos parametros para facilitar busqueda con bbdd completa
if [ "${ENTORNO_DB}" == "" -o "${VARIANTE_DB}" == "" ]; then
ENTORNO="-?"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ENTORNO_DB}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_db_search} ${PARAMETROS_SCRIPT_db_search}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar parametros
#-- [2] Busca una cadena en base de datos
#--------========--------========--------========--------========---

echo "${ENTORNO_DB}" | grep "_" &> /dev/null
SALIDA_bbdd_completa=$?

if [ "${PROYECTO_DB}" == "" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio parametros BBDD completa
#------======------======------======------======------======------=
BBDD_COMPLETA=${ENTORNO_DB}
SEARCH_DB=${VARIANTE_DB}
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

#-Igual se puede pasar la BD completa que debe tener guiones bajos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

db_exist ${BBDD_COMPLETA}
SALIDA_db_search=${SALIDA_db_exist}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Base de datos        : ${BBDD_COMPLETA}"

if [ "${SALIDA_db_exist}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio existencia BBDD en sistema
#------======------======------======------======------======------=

php -f ${LIBRERIAS_PHP}/mysql/search/search_string_in_db.php \
${ENTORNO_DB} ${VARIANTE_DB} ${PROYECTO_DB} ${SEARCH_DB}     \
&> ${NOMBRE_PANTALLA_search_database}
SALIDA_php=$?

#-No llegan los parametros de vuelta
echo "Salida orden php : ${SALIDA_php} - ${SALIDA_search_string_in_db_php}  "

if [ "${SALIDA_php}" != "0" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio se ha encontrado alguna ocurrencia
#------======------======------======------======------======------=
MOTIVO_FUNCION="Se ha lanzado la orden de busqueda con"
PARAMETROS_MOTIVO_02="Cadena encontrada     : ${SEARCH_DB}"

PANTALLA_SCRIPT="${NOMBRE_PANTALLA_search_database}"

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

MOTIVO_FUNCION="No esta disponible el comando php para efecturar la busqueda"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion php en sistema
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_search}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_search}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_search}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_search}
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





