#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="oracle"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- proceso_total
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ssh_rmdir 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia permisos en una ruta en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambia permisos ruta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] RUTA_DESTINO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E procesa_java J1 J2 nombre_clase -- Ejecuta java con los parametros indicados
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

proceso_total()
{
IS_procesa_java="Ejecuta java con los parametros indicados"
INFO_SCRIPT=${IS_procesa_java}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_java=${INFO_SCRIPT}

#$JAVA_PATH/java -cp $CLASSPATH -Dentorno=PRE -Dlog4j.debug=true -Dlog4j.configuration=file:${LOG4J_PATH}/log4j.properties ${BATCH_APP_NAME}

BATCH_JAR_01=${1}
BATCH_JAR_02=${2}

BATCH_APP_NAME=${3}
BATCH_APP_DIR=${4}


SALIDA_procesa_java=0

NOMBRE_SCRIPT_procesa_java=procesa_java
PARAMETROS_SCRIPT_procesa_java="JAR_01 JAR_02 APP_NAME [LOG4J_PATH]"

if [ "${BATCH_JAR_01}" == "" ]; then
BATCH_JAR_01=mapfre_arqos_batch.jar
fi  

if [ "${BATCH_JAR_02}" == "" ]; then
BATCH_JAR_02=mapfre_arqos_monitoring_batch.jar
fi  

if [ "${BATCH_APP_NAME}" == "" ]; then
BATCH_APP_NAME=com.mapfre.monitoring.batch.command.Launcher
fi

if [ "${BATCH_APP_DIR}" == "" ]; then
#- Si no se le indica pilla la ruta actual
BATCH_APP_DIR=${PWD}
fi


if [ "${BATCH_JAR_01}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_procesa_java} ${PARAMETROS_SCRIPT_procesa_java}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar entorno
#-- [2] Lanzar Java
#--------========--------========--------========--------========---

#--------========--------========--------========--------========---
#-Algoritmo :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Copiar los archivos
#-- [2] Procesar los archivo
#-- [3] Iterar en BBDD
#--------========--------========--------========--------========---

copiar_archivos ${SERVIDOR_REMOTO}

procesar_archivos

iterar_en_bbdd

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_java}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_java}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_java}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_java}
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
