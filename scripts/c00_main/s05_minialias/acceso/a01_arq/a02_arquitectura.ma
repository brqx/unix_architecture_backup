#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="minialias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
#+ Mini Alias definidos:
#-------------------------------------------------------------------
#-- gg - gs - gl - gw - gwo - gwl
#-------------------------------------------------------------------
#- Informacion
#-------------------------------------------------------------------
#I Alias de acceso de arquitectura - Web - Unix - Maven
#-------------------------------------------------------------------
#- Variables Requeridas
#-------------------------------------------------------------------
#-- RCT - S_RCT - A_RCT - L_RCT - ARQWEB
#-------------------------------------------------------------------

# Mini Alias de acceso - Rutas Profiling
#-====================================-

#- Ruta Scripts
alias gg='cd ${RCT}'

#- Ruta Scripts - Go Scripts
alias gs='cd ${S_RCT}'

#- Ruta Scripts - Go Sadjust
alias ga='cd ${A_RCT}'

#- Ruta Listas  - Go Listas
alias gl='cd ${L_RCT}'

#- Acceso arquitectura Web - Se separara a otro fichero
#- Oendiente de establecer una variable donde se indique la arquitectura

alias gw='cd ${ARQWEB}'

alias gwo='cd ${ARQWEB}objetos'

alias gwl='cd ${ARQWEB}listas'

