#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
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
#-- java_list_log4j
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los ficheros  dentro de un conjunto de jars
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado ficheros properties java jar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CONTENEDOR [FICHEROS_PROPERTIES]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lg4j contenedor.jar			-- Lista los ficheros log4j del contenedor indicado
#-------------------------------------------------------------------
#E lg4j contenedor.jar	AA.B	-- Lista los ficheros AA.B del contenedor indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias lcla
java_list_log4j()
{
IS_java_list_log4j="Saca el listado de los ficheros del jar indicado"
INFO_SCRIPT=${IS_java_list_log4j}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_list_log4j=${INFO_SCRIPT}

CONTENEDOR=${1}
FICHERO_PROPERTIES=${2}

SALIDA_java_list_log4j=0

NOMBRE_SCRIPT_java_list_log4j=java_list_log4j
PARAMETROS_SCRIPT_java_list_log4j="CONTENEDOR_JAR [FICHERO_PROPERTIES]"


if [ "${CONTENEDOR}" == "" ]; then
	CONTENEDOR="-?"
fi  

if [ "${FICHERO_PROPERTIES}" == "" ]; then
FICHERO_PROPERTIES="log4j.properties"
fi  


if [ "${CONTENEDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_list_log4j} ${PARAMETROS_SCRIPT_java_list_log4j}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--Como es una funcion que se puede invocar directamente subimos uno el sw de acceso

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

stat "${CONTENEDOR}" &> /dev/null
SALIDA_stat=$?
SALIDA_tailf=${SALIDA_stat}

#-Parametros comunes
PARAMETROS_MOTIVO_01="Archivo      : ${CONTENEDOR}"
PARAMETROS_MOTIVO_02="Properties   : ${FICHERO_PROPERTIES}"


if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

#-- Aqui puede fallar la jvm
for i in $(jar tvf ${CONTENEDOR} | grep ${FICHERO_PROPERTIES} | tr -s " " | cut -d " " -f9-) ; do
echo "$i -- $CONTENEDOR" 
done

MOTIVO_FUNCION="Jar listado de forma correcta"

else

MOTIVO_FUNCION="Error al acceder al archivo"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_java_list_log4j}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_list_log4j}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_list_log4j}

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


return ${SALIDA_java_list_log4j}
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
