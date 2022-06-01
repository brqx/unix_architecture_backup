#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- quita_espacios_fn
#-------------------------------------------------------------------
#+ Funciones / Variables / Alias Requeridas/os
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia los espacios de los ficheros de la ruta actual por guiones bajos 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T limpia ficheros espacios guiones cambio carpetas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [tipo] [ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E quita_espacios_fn -- Cambia los espacios de los ficheros de la ruta actual por guiones bajos 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias qs
quita_espacios_fn()
{
IS_quita_espacios_fn="Cambia los espacios por guiones bajos"
INFO_SCRIPT=${IS_quita_espacios_fn}

TIPO_FICHERO=${1}
RUTA_PASADA=${2}

if [ "${TIPO_FICHERO}" == "" ]; then
## Activamos fichero por defecto
TIPO_FICHERO="f"
fi  

if [ "${TIPO_FICHERO}" != "f" ]; then
TIPO_FICHERO="-?"
fi  

if [ "${TIPO_FICHERO}" != "d" ]; then
TIPO_FICHERO="-?"
fi  


if [ "${RUTA_PASADA}" == "" ]; then
## Activamos la ruta actual
RUTA_PASADA=${PWD}
fi  


if [ "${TIPO_FICHERO}" == "-?" ]; then

e_pmt quita_espacios_fn "[tipo] [ruta]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

RUTA_ACTUAL=$PWD

cd ${RUTA_PASADA}

find $PWD -name '* *' -type ${TIPO_FICHERO} | rename 's/ /_/g'

cd ${RUTA_ACTUAL}

fi
}
#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

