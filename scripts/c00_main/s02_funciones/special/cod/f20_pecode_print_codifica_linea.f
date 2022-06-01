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
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- pecode
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ecode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Imprime una linea codificada
#-------------------------------------------------------------------
#T echo print impresion codificacion code linea espacios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E pecode LINEA   -- Imprime una linea codificada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

pecode()
{
IS_pecode="Imprime una linea codificada"
INFO_SCRIPT=${IS_pecode}

INFO=$1

if [ "${INFO}" == "-?" ]; then

e_pmt pecode "LINEA_A_CODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

ecode "$@"
echo "${SALIDA_ECODE}"

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
