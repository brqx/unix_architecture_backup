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
#-- java_list_class
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - codjar
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las clases dentro de un conjunto de jars
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado clases java jar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P clase 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lcla contenedor.jar		-- Lista las clases en el contenedor indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias lcla
java_list_class()
{
IS_java_list_class="Saca el listado de clases del jar indicado"
INFO_SCRIPT=${IS_java_list_class}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_list_class=${INFO_SCRIPT}

CONTENEDOR=${1}

SALIDA_java_list_class=0

NOMBRE_SCRIPT_java_list_class=java_list_class
PARAMETROS_SCRIPT_java_list_class="CONTENEDOR_JAR"


if [ "${CONTENEDOR}" == "" ]; then
	CONTENEDOR="-?"
fi  


if [ "${CONTENEDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_list_class} ${PARAMETROS_SCRIPT_java_list_class}

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
PARAMETROS_MOTIVO_01="Archivo      : ${ARCHIVO}"

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

echo "Antes de procesar el contenedor"

#-- Aqui puede fallar la jvm - hace falta un codjar
for indice_lista in $(codjar ${CONTENEDOR} | grep "class$" ) ; do
LINEA_JAR_ACTUAL_CODIFICADA=${indice_lista}
dcode "${LINEA_JAR_ACTUAL_CODIFICADA}"
LINEA_JAR_ACTUAL="${SALIDA_DCODE}"

PAQUETE_CLASE=$(echo "${LINEA_JAR_ACTUAL}" | tr -s " " | cut -d " " -f9- )
SIZE_CLASE==$(echo "${LINEA_JAR_ACTUAL}"   | tr -s " " | cut -d " " -f2 )

##echo "procesando : $LINEA_JAR_ACTUAL_CODIFICADA "

echo "${PAQUETE_CLASE} -- ${SIZE_CLASE} -- ${CONTENEDOR}" 
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

INFO_SCRIPT=${INFO_SCRIPT_java_list_class}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_list_class}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_list_class}

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


return ${SALIDA_java_list_class}
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
