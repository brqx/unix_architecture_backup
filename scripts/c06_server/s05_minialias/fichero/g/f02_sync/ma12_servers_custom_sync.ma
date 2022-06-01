#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.3"          #  Version del Script actual
FECHA_SCRIPT="Julio 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="proceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Alias definidos:
#-------------------------------------------------------------------
#-- sylpsp - sysplp
#-------------------------------------------------------------------
#-- syculo - sylocu
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- sync_custom_to_local - sync_local_to_custom
#-------------------------------------------------------------------
#-- sync_local_path_to_server_path - sync_server_path_to_local_path
#-------------------------------------------------------------------

# Variables - Alias - Librerias
#-====================================-

#- Alias de sincronismo agil de servidores

#-Alias generales
alias sylpsp="sync_local_path_to_server_path"
alias sysplp="sync_server_path_to_local_path"


#-Alias customs
alias syculo="sync_custom_to_local"
alias sylocu="sync_local_to_custom"

