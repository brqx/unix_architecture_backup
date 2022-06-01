#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- java_find_class
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - java_list_class
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca una clase dentro de un conjunto de jars
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda clase java jar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P clase 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fcla clase1		-- Busca la clase en todos los jar de la ruta indicada
#-------------------------------------------------------------------
#E java_find_class c1 $RUT -- Busca la clase c1 en la ruta $RUT
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias fcla
java_find_class()
{
IS_java_find_class="Localiza la clase en un jar o en una ruta donde hay ficheros jar"
INFO_SCRIPT=${IS_java_find_class}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_find_class=${INFO_SCRIPT}

CLASE=${1}
RUTA_JAR_PASADO=${2}

SALIDA_java_find_class=0

NOMBRE_SCRIPT_java_find_class=java_find_class
PARAMETROS_SCRIPT_java_find_class="CLASE [RUTA CONTENEDOR_JAR]"

if [ "${CLASE}" == "" ]; then
CLASE="-?"
fi  

if [ "${RUTA_JAR_PASADO}" == "" ]; then
RUTA_JAR_PASADO=${PWD}
fi  


if [ "${CLASE}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_find_class} ${PARAMETROS_SCRIPT_java_find_class}

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
##echo "class $i - grep $CLASE "
java_list_class $i | grep $CLASE
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Debe conservar 0 si ya ha habido alguno
##echo "${CODIGO_salida} * ${SALIDA_java_find_class}"

if [ "${SALIDA_java_list_class}" != "" ] ; then
CODIGO_salida=$(expr ${CODIGO_salida} \* ${SALIDA_java_list_class} )
fi

done

SALIDA_java_find_class=${CODIGO_salida}


PARAMETROS_MOTIVO_01="Clase      : ${CLASE}"
PARAMETROS_MOTIVO_01="Ruta       : ${RUTA_JAR_PASADO}"

if [ "${CODIGO_salida}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion clase
#--------========--------========--------========--------========---

MOTIVO_FUNCION="La clase existe en la ruta indicada"

else

MOTIVO_FUNCION="La clase no existe en la ruta"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion clase
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_java_find_class}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_find_class}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_find_class}

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


return ${SALIDA_java_find_class}
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
