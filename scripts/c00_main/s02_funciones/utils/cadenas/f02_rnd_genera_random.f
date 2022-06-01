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
#-- rnd_corte - rnd_num
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- RANDOM
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene numeros aleatorios en Unix / bash
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T numeros aleatorios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [numero_tope] | [numero_cifras] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E rnd_num 69 - Genera un numero del 0 al 68
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Generamos un numero aleatorio hasta N cifras
rnd_corte()
{
IS_rnd_corte="Generamos un numero aleatorio de N cifras"
INFO_SCRIPT=${IS_rnd_corte}

corte=$1

if [ "${corte}" == "" ] ; then
corte=10
fi

if [ "${corte}" == "-?" ] ; then
	
e_pmt rnd_corte "corte"
else


NUMERO=${RANDOM}${RANDOM}

NUMERO_CORTO=$(echo ${NUMERO} | cut -c-${corte} )

echo ${NUMERO_CORTO}

fi
}

#- Alias rnd
#- Generamos un numero aleatorio hasta el numero pasado
rnd_num()
{
IS_rnd_num="Generamos un numero aleatorio indicando el filtro maximo para el mismo"
INFO_SCRIPT=${IS_rnd_num}

num_corte=$1

if [ "${num_corte}" == "" ] ; then
num_corte=10
fi


if [ "${num_corte}" == "-?" ] ; then
	
e_pmt rnd_corte "corte"
else

NUMERO=${RANDOM}${RANDOM}

NUMERO_CORTO=$((${NUMERO} % ${num_corte} ))

echo ${NUMERO_CORTO}

fi
}

