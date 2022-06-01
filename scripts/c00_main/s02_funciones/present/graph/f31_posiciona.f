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
#-- posiciona
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una linea normal de longitud determinada
#-------------------------------------------------------------------
#T generar linea normal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LONGITUD
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E posiciona AA				-- Posiciona el texto AA
#-------------------------------------------------------------------
#E posiciona BB 10 10		-- Posiciona el texto BB en las coordenadas X10 Y10
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Genera una linea normal de guiones
posiciona()
{
IS_posiciona="Posiciona un dato en pantalla y recupera el cursor"
INFO_SCRIPT=${IS_posiciona}

TEXTO=$1
POS_X=$2
POS_Y=$3

if [ "${TEXTO}" == "" ]; then
CARACTER="-?"
fi

if [ "${POS_X}" == "" ]; then
POS_X=70
fi

if [ "${POS_Y}" == "" ]; then
POS_Y=2
fi

if [ "${TEXTO}" == "-?" ]; then

e_pmt posiciona "TEXTO"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- Grabar la posicion
tput sc 

#- Move cursor to screen location X Y (top left is 0 0)
tput cup ${POS_Y} ${POS_X}

echo "[ ${TEXTO} ]"

#- Recuperar la posicion
tput rc 

fi

#-Vaciado de variables

POS_X=
POS_Y=

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
