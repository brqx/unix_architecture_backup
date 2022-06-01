#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="minialias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Mini Alias definidos:
#-------------------------------------------------------------------
#-- syf - syp
#-------------------------------------------------------------------
#- Funciones /Variables Requeridas
#-------------------------------------------------------------------
#-- sync_file_to_server - sync_path_to_server
#-------------------------------------------------------------------


# Mini Alias de sincronismo (rsync) - Brqx Cpanel
#-====================================-

#- Sincroniza un fichero con un servidor remoto
alias syf='sync_file_to_server'

#- Sincroniza una carpeta con un servidor remoto
alias syp='sync_path_to_server'

