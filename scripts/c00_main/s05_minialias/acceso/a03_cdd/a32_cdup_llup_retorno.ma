#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2009
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2009"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista de $CONCEPT_MOLDE Comunes"
#-==================================================================
#+ Alias definidos:
#-------------------------------------------------------------------
#-- cdup - llup
#-------------------------------------------------------------------
#- Requiere
#-------------------------------------------------------------------
#-- alias ( ll )
#-------------------------------------------------------------------

#Alias cddw - Movimiento en rutas

alias cdup='cd .. && ll'
alias llup='cdup'

#- Nota: Como los alias no pueden tener parametros, para el inverso cddw
#        necesitamos una funcion.
#

