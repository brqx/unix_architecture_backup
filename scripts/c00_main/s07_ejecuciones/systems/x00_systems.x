#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="ejecuciones"
CONCEPT_ARQUETIPO="systems"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- macos - linux 
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2022
#-------------------------------------------------------------------

# Version de Php

#- Igual hay que adaptarlo segun que version de df tengamos

uname -a | grep Darwin 2> /dev/null 

if [ $? -eq 0 ] ; then
SYSTEM_OS=mac 
TMP_DIR=${TMPDIR}
else

uname -a | grep Linux 2> /dev/null 

if [ $? -eq 0 ] ; then

SYSTEM_OS=linux
TMP_DIR=/tmp/
TMPDIR=${TMP_DIR}
fi

fi

export SYSTEM_OS
