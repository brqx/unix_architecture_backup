#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="present"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- genera_cadena_espacios
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera e imprime una cadena de espacios
#-------------------------------------------------------------------
#T generar cadena espacios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [NUM] [CARACTER]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_cadena_espacios 20 #	-- Genera cadena de 20 almoadillas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-alias genspace
genera_cadena_espacios()
{
IS_genera_cadena_espacios="Genera una sucesion del caracter indicado o de espacios por defecto"
INFO_SCRIPT=${IS_genera_cadena_espacios}

NUM_CARACTERES=$1
CARACTER_PASADO=$2


if [ "${NUM_CARACTERES}" == "" ] ; then
NUM_CARACTERES=10
fi

if [ "${CARACTER_PASADO}" == "" ] ; then
CARACTER_PASADO='\040'
fi


if [ "${NUM_CARACTERES}" == "-?" ] ; then

e_pmt genera_cadena_espacios "[NUM_CARACTERES] [CARACTER_PASADO]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

cont=0
CADENA_ESPACIOS=

while [ ${cont} -lt ${NUM_CARACTERES} ] ; do

CADENA_ESPACIOS="${CADENA_ESPACIOS}${CARACTER_PASADO}"

let cont++
done

echo -e ${CADENA_ESPACIOS}
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
