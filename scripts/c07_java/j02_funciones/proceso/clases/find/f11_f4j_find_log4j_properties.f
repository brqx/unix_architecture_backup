#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- java_find_log4j
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - java_list_log4j
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca un fichero dentro de un conjunto de jars
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda fichero properties java jar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FICHERO] [RUTA]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E f4j clase1				-- Busca el fichero clase1 en todos los jar de la ruta indicada
#-------------------------------------------------------------------
#E java_find_log4j c1 $RUT	-- Busca el fichero c1 en la ruta $RUT
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias fcla
java_find_log4j()
{
IS_java_find_log4j="Localiza ficheros log4j en un jar o en una ruta donde hay ficheros jar"
INFO_SCRIPT=${IS_java_find_log4j}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_find_log4j=${INFO_SCRIPT}

FICHERO_PROPERTIES=${1}
RUTA_JAR_PASADO=${2}

SALIDA_java_find_log4j=0

NOMBRE_SCRIPT_java_find_log4j=java_find_log4j
PARAMETROS_SCRIPT_java_find_log4j="FICHERO_PROPERTIES [RUTA CONTENEDOR_JAR]"

if [ "${FICHERO_PROPERTIES}" == "" ]; then
FICHERO_PROPERTIES="log4j.properties"
fi  

if [ "${RUTA_JAR_PASADO}" == "" ]; then
RUTA_JAR_PASADO=${PWD}
fi  


if [ "${FICHERO_PROPERTIES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_find_log4j} ${PARAMETROS_SCRIPT_java_find_log4j}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--Como es una funcion que se puede invocar directamente subimos uno el sw de acceso

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
CODIGO_salida=1

for i in $(find ${RUTA_JAR_PASADO} -type f -name "*.jar") ; do 
JAR_ACTUAL=$i

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
java_list_log4j $i | grep ${FICHERO_PROPERTIES}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Debe conservar 0 si ya ha habido alguno
#-Probar escribir en una posicion
##echo "${CODIGO_salida} - ${SALIDA_java_find_log4j}"
if [ "${SALIDA_java_list_log4j}" != "" ] ; then
CODIGO_salida=$(expr ${CODIGO_salida} \* ${SALIDA_java_list_log4j} )
fi

done

SALIDA_java_find_log4j=${CODIGO_salida}

PARAMETROS_MOTIVO_01="Fichero    : ${FICHERO_PROPERTIES}"
PARAMETROS_MOTIVO_01="Ruta       : ${RUTA_JAR_PASADO}"

if [ "${CODIGO_salida}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion clase
#--------========--------========--------========--------========---

MOTIVO_FUNCION="El fichero existe en la ruta indicada"

else

MOTIVO_FUNCION="El fichero no existe en la ruta"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion clase
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_java_find_log4j}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_find_log4j}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_find_log4j}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#-Quitamos el sw
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

return ${SALIDA_java_find_log4j}
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
