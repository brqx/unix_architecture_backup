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
CONCEPT_ARQUETIPO="terminal"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- php
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2013
#-------------------------------------------------------------------

# Version de Php

FILE_LANGUAGE=${HOME}/java_php_version.ver

#- Ajuste para php 4
php --version > ${FILE_LANGUAGE}
VERSION_PHP=$( cat ${FILE_LANGUAGE} | grep PHP | grep -v Copyright | \
cut -d " " -f2 | cut -d "-" -f1 )
rm -f ${FILE_LANGUAGE}

