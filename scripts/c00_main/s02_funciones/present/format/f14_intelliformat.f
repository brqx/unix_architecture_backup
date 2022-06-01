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
#-- intelliformat
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- establece_maxima_longitud - formatea
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Formatea la entrada para generar una salida homogenea
#-------------------------------------------------------------------
#T formato formatear linea entrada inteligente
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_A_FORMATEAR
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E intelliformat LINEA		-- Formatea esa linea de forma inteligente
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Debe formatear la entrada de forma inteligente
intelliformat()
{
IS_intelliformat="Formatea esa linea de forma inteligente. Por maxima longitud."
INFO_SCRIPT=${IS_intelliformat}

INFO=$1

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt intelliformat "LINEA_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_ENTRADA="$@"

establece_maxima_longitud ${LINEA_ENTRADA}

formatea ${LINEA_ENTRADA}

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
