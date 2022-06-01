#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Julio 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="producto"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- cpanel
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2013
#-------------------------------------------------------------------

# Version de Cpanel

FILE_LANGUAGE=${HOME}/spazio_version.ver

/usr/local/cpanel/cpanel -V > ${FILE_LANGUAGE}
VERSION_PYTHON=$( cat ${FILE_LANGUAGE} | grep build )
rm -f ${FILE_LANGUAGE}

EXISTE_CPANEL=$(which cpanel | wc -l)
