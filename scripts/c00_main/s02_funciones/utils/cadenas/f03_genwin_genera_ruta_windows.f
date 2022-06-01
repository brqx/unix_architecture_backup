#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- genera_ruta_windows - genera_ruta_unix
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Convierte la ruta unix en ruta windows
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T genera path windows
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [BASE_RUTA] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gen_windows_path scripts/listas --> c:\scripts\listas
#-------------------------------------------------------------------
#E gen_unix_path '\scripts\listas' --> /scripts/listas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-alias gen_win_path
genera_ruta_windows()
{
IS_genera_ruta_windows="Genera la ruta windows partiendo de un path unix"
INFO_SCRIPT=${IS_genera_ruta_unix}

BASE_PASADA=$1
RUTA_ACTUAL=$PWD

RUTA_WINDOWS=$(echo ${RUTA_ACTUAL} | sed "s/\//\\\\/g" )

echo "${BASE_PASADA}${RUTA_WINDOWS}"

}

#-------------------------------------------------------------------

#- Genera la ruta unix correspondiente a la indicada tipo windows
#  Debemos pasar la ruta entre comillas simples para que se sepa que no hay que interpretar las barras
genera_ruta_unix()
{
IS_genera_ruta_unix="Genera la ruta unix correspondiente a la indicada tipo windows"
INFO_SCRIPT=${IS_genera_ruta_unix}

#-Aqui solo mantenemos la barra para que no desaparezca al hacer el echo o al asignar a la variable
RUTA_PASADA=$( echo "$1" | sed "s/\\\\/\\\\/g" )

RUTA_UNIX=$( echo ${RUTA_PASADA} | sed "s/\\\\/\//g" )

echo ${RUTA_UNIX}
}

