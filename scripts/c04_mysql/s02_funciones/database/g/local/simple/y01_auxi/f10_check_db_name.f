#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="tested"
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
#-- check_db_name
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Analiza la ruta completa con nombre del archivo retornando su estructura analizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T check analisis nombre ruta archivo fichero sql tar gz
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P RUTA_COMPLETA_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_db_name /aa/bb/cc/za_d50prok  --> Devuelve la estructura solicitada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


check_db_name()
{
IS_check_db_name="Analiza la ruta pasada devolviendo la estructura solicitada"
INFO_SCRIPT=${IS_check_db_name}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_check_db_name=${INFO_SCRIPT}

#-- Si se pasa solo un parametro y que se saque de ahi la BBDD

RUTA_COMPLETA_ARCHIVO=$1

SALIDA_check_db_name=0

NOMBRE_SCRIPT_check_db_name=check_db_name
PARAMETROS_SCRIPT_check_db_name="[RUTA_IMPORT_COMPLETA]"


if [ "${RUTA_COMPLETA_ARCHIVO}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_check_db_name} ${PARAMETROS_SCRIPT_check_db_name}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar si es ruta absoluta
#-- [2] Comprobar si es sql o gz
#-- [3] Devolver la informacion
#--------========--------========--------========--------========---

#-Analisis de lo pasado - ver si se pasa solo un parametro
#-- Ejemplo : 
#   za_d70cars.sql
#   /xx/yy/za_d70cars.sql
#--

#-Devuelven archivo y ruta sin barras. Si no hay carpeta la ruta es un punto 
BD_NOMBRE_FICHERO=$( basename ${RUTA_COMPLETA_ARCHIVO} )
BD_RUTA=$( dirname ${RUTA_COMPLETA_ARCHIVO} )

#-- ANALISIS DEL ARCHIVO --

echo ${BD_NOMBRE_FICHERO} | grep "sql$" &> /dev/null
ES_SQL=$?

echo ${BD_NOMBRE_FICHERO} | grep "sql.tar.gz$" &> /dev/null
ES_TAR_GZ=$?

PARAMETROS_MOTIVO_01="Ruta Completa   : ${RUTA_COMPLETA_ARCHIVO}"
PARAMETROS_MOTIVO_02="Fichero pasado  : ${BD_NOMBRE_FICHERO}"

if [ "${ES_SQL}" == "0" ] ; then
#---===---===---===---===---===---===---===---===---===---===---===-
#----- [1] Inicio analisis del archivo
#---===---===---===---===---===---===---===---===---===---===---===-

NOMBRE_BBDD=$(echo ${BD_NOMBRE_FICHERO} | cut -d "." -f1 )
NOMBRE_BBDD_SQL=${BD_NOMBRE_FICHERO}

SALIDA_check_db_name=0

MOTIVO_FUNCION="Fichero SQL pasado."
PARAMETROS_MOTIVO_03="Nombre BBDD      : ${NOMBRE_BBDD}"


elif [ "${ES_TAR_GZ}" == "0" ] ; then

NOMBRE_BBDD=$( echo ${BD_NOMBRE_FICHERO} | cut -d "." -f1 )
NOMBRE_BBDD_SQL=$( echo ${BD_NOMBRE_FICHERO} | cut -d "." -f1-2 )
NOMBRE_BBDD_TAR_GZ=${BD_NOMBRE_FICHERO}

SALIDA_check_db_name=0

MOTIVO_FUNCION="Fichero TAR.GZ pasado."
PARAMETROS_MOTIVO_03="Nombre SQL       : ${NOMBRE_BBDD_SQL}"
PARAMETROS_MOTIVO_04="Nombre BBDD      : ${NOMBRE_BBDD}"

else

SALIDA_check_db_name=1

MOTIVO_FUNCION="Fichero pasado no se corresponde con las extensiones esperadas"

#---===---===---===---===---===---===---===---===---===---===---===-
#----- [1] Fin analisis del archivo
#---===---===---===---===---===---===---===---===---===---===---===-
fi

if [ "${SALIDA_check_db_name}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Inicio analisis de la ruta
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-- ANALISIS DE LA RUTA --
if [ "${BD_RUTA}" == "." ] ; then
#---===---===---===---===---===---===---===---===---===---===---===-
#----- [2] Inicio check ruta pasada
#---===---===---===---===---===---===---===---===---===---===---===-

RUTA_ACTUAL=$PWD/
#-Al ser una variable ya establecida no hace falta barra
RUTA_OPERACIONES=${DB_GLOBAL_IMPORT}
RUTA_IMPORTACION_COMPLETA=${RUTA_ACTUAL}${BD_NOMBRE_FICHERO}
RUTA_OPERACIONES_COMPLETA=${DB_GLOBAL_IMPORT}${BD_NOMBRE_FICHERO}

MOTIVO_FUNCION="${MOTIVO_FUNCION} Ruta no pasada. Intentamos actual."

else


RUTA_OPERACIONES=${BD_RUTA}/
RUTA_IMPORTACION_COMPLETA=${BD_RUTA}/${BD_NOMBRE_FICHERO}

MOTIVO_FUNCION="${MOTIVO_FUNCION} Ruta pasada."

#---===---===---===---===---===---===---===---===---===---===---===-
#----- [2] Fin check ruta pasada
#---===---===---===---===---===---===---===---===---===---===---===-
fi

PARAMETROS_MOTIVO_05="Ruta Operaciones : ${RUTA_OPERACIONES}"
PARAMETROS_MOTIVO_06="Ruta Final       : ${RUTA_IMPORTACION_COMPLETA}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Fin analisis de la ruta
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#-Vamos a comprobar la ruta

stat ${RUTA_IMPORTACION_COMPLETA} &> /dev/null
SALIDA_stat=$?

if [ "${SALIDA_stat}" == "0" ] ; then
#---===---===---===---===---===---===---===---===---===---===---===-
#----- [1] Inicio analisis existencia del archivo
#---===---===---===---===---===---===---===---===---===---===---===-
MOTIVO_FUNCION="${MOTIVO_FUNCION} La ruta final del archivo existe. "
SALIDA_check_db_name=0

else

MOTIVO_FUNCION="${MOTIVO_FUNCION} La ruta final del archivo no existe. "
SALIDA_check_db_name=2

stat ${RUTA_OPERACIONES_COMPLETA} &> /dev/null
SALIDA_stat=$?

if [ "${SALIDA_stat}" == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio analisis existencia del archivo
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

RUTA_IMPORTACION_COMPLETA=${RUTA_OPERACIONES_COMPLETA}
MOTIVO_FUNCION="${MOTIVO_FUNCION} Intentamos global con exito."
SALIDA_check_db_name=0

else

MOTIVO_FUNCION="${MOTIVO_FUNCION} Intentamos global sin exito."
SALIDA_check_db_name=3

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin analisis existencia del archivo
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi

#---===---===---===---===---===---===---===---===---===---===---===-
#----- [2] Fin analisis existencia del archivo
#---===---===---===---===---===---===---===---===---===---===---===-
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_check_db_name}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_check_db_name}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_check_db_name}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_check_db_name}
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

