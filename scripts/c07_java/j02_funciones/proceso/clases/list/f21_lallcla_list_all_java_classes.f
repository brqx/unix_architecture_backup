#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- java_listall_classes
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - java_list_class - posiciona
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
#E java_listall_classes c1 $RUT -- Busca la clase c1 en la ruta $RUT
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias listalljava
java_listall_classes()
{
IS_java_listall_classes="Lista todas las clases de los jars indicados"
INFO_SCRIPT=${IS_java_listall_classes}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_listall_classes=${INFO_SCRIPT}

RUTA_CONTENEDOR_JAR_PASADO=${1}

SALIDA_java_listall_classes=0

NOMBRE_SCRIPT_java_listall_classes=java_listall_classes
PARAMETROS_SCRIPT_java_listall_classes="[RUTA CONTENEDOR_JAR]"


if [ "${RUTA_CONTENEDOR_JAR_PASADO}" == "" ]; then
RUTA_CONTENEDOR_JAR_PASADO=${PWD}
fi  


if [ "${RUTA_CONTENEDOR_JAR_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_listall_classes} ${PARAMETROS_SCRIPT_java_listall_classes}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--Como es una funcion que se puede invocar directamente subimos uno el sw de acceso

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
CODIGO_salida=1

##echo "Antes del for "
ARCHIVO_CLASES_JAVA_UNSORTED=./java_listado_total_clases_no_ordenado.dat

if [ -e ${ARCHIVO_CLASES_JAVA_UNSORTED} ] ; then
rm -f ${ARCHIVO_CLASES_JAVA_UNSORTED}
fi

for indice_jj in $(find ${RUTA_CONTENEDOR_JAR_PASADO} -type f -name "*.jar") ; do 
CONTENEDOR_JAR_ACTUAL=${indice_jj}
posiciona "[ Jar : ${CONTENEDOR_JAR_ACTUAL} ]"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "class ${CONTENEDOR_JAR_ACTUAL}"
java_list_class ${CONTENEDOR_JAR_ACTUAL} >> ${ARCHIVO_CLASES_JAVA_UNSORTED}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
let cont_lallcla++

done  

##echo "Lanzamos el cat ordenando la salida"

cat ${ARCHIVO_CLASES_JAVA_UNSORTED} | sort -u

SALIDA_java_listall_classes=${SALIDA_java_list_class}

PARAMETROS_MOTIVO_01="Ruta       : ${RUTA_CONTENEDOR_JAR_PASADO}"

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

INFO_SCRIPT=${INFO_SCRIPT_java_listall_classes}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_listall_classes}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_listall_classes}

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


return ${SALIDA_java_listall_classes}
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
