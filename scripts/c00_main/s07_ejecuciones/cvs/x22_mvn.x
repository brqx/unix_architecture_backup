#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2009
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="terminal"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- mvn
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

# Version de Java

#- Especificar JAVA_HOME y insertarla en PATH
#
## JAVA_HOME=/opt/java1.5/bin
## Ajuste Mapfre - Websphere

JAVA_HOME=/opt/WebSphere61/AppServer/java/bin
PATH=$PATH:$JAVA_HOME

FILE_LANGUAGE=${HOME}/java_php_version.ver

mvn --version 2> ${FILE_LANGUAGE}
VERSION_MVN=$( cat ${FILE_LANGUAGE} | grep Maven | cut -d " " -f3 )
rm -f ${FILE_LANGUAGE}

