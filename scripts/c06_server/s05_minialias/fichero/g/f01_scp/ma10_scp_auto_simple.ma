#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="minialias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Mini Alias definidos:
#-------------------------------------------------------------------
#-- cfs - cfp - cfh
#-------------------------------------------------------------------
#- Funciones /Variables Requeridas
#-------------------------------------------------------------------
#-- cf_to_server_home - cf_to_server_path - cf_sync_to_server
#-------------------------------------------------------------------


# Mini Alias de fichero - SCP - Brqx Cpanel
#-====================================-

#- Copia de ficheros en la misma ruta
alias cfs='cf_sync_to_server'

#- Copia de carpetas en una carpeta indicada
alias cfp='cf_path_to_server'

#- Copia de carpetas en la misma ruta partiendo de un home RCT
alias cfh='cf_to_server_home'
