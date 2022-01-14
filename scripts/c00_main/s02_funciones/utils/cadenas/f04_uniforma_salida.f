#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- uniforma_salida
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Prepara la salida de error para que cualquier valor superior a 0 sea 1
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T uniforma salida error cero
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [codigo_error]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uniforma_salida  4 - Devolvera el valor 1
#-------------------------------------------------------------------
#E uniforma_salida  0 - Devolvera el valor 0
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

uniforma_salida()
{
IS_uniforma_salida="Prepara la salida de error para que cualquier valor superior a 0 sea 1"
INFO_SCRIPT=${IS_uniforma_salida}

codigo=$1


if [ "${codigo}" == "" ] ; then
codigo="-1"
fi

if [ "${codigo}" == "-?" ] ; then
	
e_pmt uniforma_salida "codigo"

else

if [ "${codigo}" -gt "0" ] ; then
codigo=1
fi

SALIDA_uniforma_salida=${codigo}
return ${codigo}
fi  
}
