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
#-- cvs
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

# Version de Cvs

FILE_LANGUAGE=${HOME}/java_php_version.ver

cvs -version > ${FILE_LANGUAGE}
VERSION_CVS=$( cat ${FILE_LANGUAGE} | grep Concurrent | cut -d " " -f5  )
rm -f ${FILE_LANGUAGE}


