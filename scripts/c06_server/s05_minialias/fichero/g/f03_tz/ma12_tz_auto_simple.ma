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
#-- czl - czf
#-------------------------------------------------------------------
#- Funciones /Variables Requeridas
#-------------------------------------------------------------------
#-- czl_to_server - czf_to_server
#-------------------------------------------------------------------


# Mini Alias de fichero - TAR GZ - Brqx Cpanel
#-====================================-

#- Copia de ficheros en la misma ruta
alias czl='czl_to_server'

#- Copia de carpetas en una carpeta indicada
alias czf='czf_to_server'

