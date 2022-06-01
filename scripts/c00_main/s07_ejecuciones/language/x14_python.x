#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="language"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- python
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

# Version de Python

FILE_LANGUAGE=${HOME}/python_version.ver

python -V 2> ${FILE_LANGUAGE}
VERSION_PYTHON=$( cat ${FILE_LANGUAGE} | grep Python | cut -d " " -f2 )
rm -f ${FILE_LANGUAGE}

EXISTE_PYTHON=$(which python | wc -l)
