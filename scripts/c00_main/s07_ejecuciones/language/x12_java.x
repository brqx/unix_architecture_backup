#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="terminal"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- java
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#-SERVER_CHANGE-  -- Cambios especificos de servidor

# Version de Java

#- Especificar JAVA_HOME y insertarla en PATH
#

#-Permitimos establcer una variable JAVA independiente del Websphere
JAVA_HOME=/usr/bin
SOLR_HOME=/zlk/solr/bin


PATH=$PATH:${JAVA_HOME}:${SOLR_HOME}

FILE_LANGUAGE=${HOME}/java_php_version.ver

java -version 2> ${FILE_LANGUAGE}
VERSION_JAVA=$( cat ${FILE_LANGUAGE} | grep version | cut -d " " -f3 | cut -d '"' -f2 )
rm -f ${FILE_LANGUAGE}

