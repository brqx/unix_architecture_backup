#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="listado"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- lff
#-====----========----========----========----========----========--
#- Lista las funciones existentes en la ruta indicada
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#E lff -- Saca ficheros tipo listado a partir de la ruta actual
#-==================================================================

#-Ej: f la --> Lista archivos tipo listado

lff()
{
IS_lff="Muestra ficheros tipo listado"
INFO_SCRIPT=${IS_lff}

f "l*"      ;
}

