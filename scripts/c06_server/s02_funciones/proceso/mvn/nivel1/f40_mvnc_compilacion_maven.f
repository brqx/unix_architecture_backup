#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvni
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Instala una artefacto de maven en el repositorio local
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener libreria mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P libreria [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_install artefacto artefacto.jar -- Instla el artefacto indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini Alias mvni
mvn_install()
{
IS_mvn_install="Instala un artefacto de maven en la ruta local"
INFO_SCRIPT=${IS_mvn_install}

#-Obligamos que se le pase file y artifact id
FILE=$2
ARTIFACT_ID=$1
GROUP_ID=$3
RUTA_WORKSPACE=$4

if [ "${FILE}" == "" ]; then
	FILE="-?"
fi  

if [ "${ARTIFACT_ID}" == "" ]; then
	FILE="-?"
fi

if [ "${GROUP_ID}" == "" ]; then
#- Este lo dejamos como por defecto
GROUP_ID=com.mapfre.arqos.lib.wps
fi

if [ "${RUTA_WORKSPACE}" == "" ]; then
RUTA_WORKSPACE=/home/ricabel/zfolders/down/Entrada/Virtual/wps_704_maven/
fi

if [ "${FILE}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_install "FILE ARTIFACT_ID [GROUP_ID]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

#- Queremos conseguir lo siguiente : 
#-------------------------------------------------------------------
# mvn install:install-file \
# -DgroupId=com.mapfre.arqos.lib.wps 
# -DartifactId=com.ibm.msg.client.jms.internal 
# -Dversion=11.2.0 -Dpackaging=jar 
# -Dfile=C:\WPS7004\WPS_7004\WPS_7004\com.ibm.msg.client.jms.internal-11.2.0.jar
#-------------------------------------------------------------------

#- Guardar la ruta actual

RUTA_MAVEN=${RUTA_WORKSPACE}${FILE}

mvn install:install-file \
-DgroupId=${GROUP_ID}
-DartifactId=${ARTIFACT_ID}
-Dversion=11.2.0 -Dpackaging=jar 
-Dfile=${RUTA_MAVEN}


#-- Volver al path guardado

cd ${RUTA_ACTUAL}

fi


#- Vaciamos las variables
GROUP_ID=
RUTA_WORKSPACE=


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
