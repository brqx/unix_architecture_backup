#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
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
#-- center_text
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - genera_cadena_espacios
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra un texto centrado
#-------------------------------------------------------------------
#T centrar alinear texto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [TEXTO A CENTRAR] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E center_text Titulo				-- Centra Titulo en una linea
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-Genera una linea con el titulo centrado
center_text()
{
IS_center_text="Muestra un texto centrado"
INFO_SCRIPT=${IS_center_text}

LINEA_PASADA=$@

if [ "${LINEA_PASADA}" == "" ]; then
LINEA_PASADA="-"
fi

#-Se trata de una variable global para todas las lineas de una presentacion
if [ "${LONGITUD_ESTABLECIDA}" == "" ] ; then
LONGITUD_LINEA=${LONGITUD_LINEA_GLOBAL}
else
LONGITUD_LINEA=${LONGITUD_ESTABLECIDA}
fi

if [ "${LINEA_PASADA}" == "-?" ]; then

e_pmt center_text "[LINEA_PASADA]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#----=----=----=----=----=----=----=----=----=----=----=----=----=--

# Pasamos (-titulito-)

#- Debemos generar : 

# [_______________________(-titulito-)_________________________

# Linea = 80
# Titulo = 6
#
# Posicion Centrada Titulo = Linea /2 - Titulo / 2

#- Si el caracter es de varias posiciones hay que dividir la longitud
#  entre las mismas

LONGITUD_CARACTER=${#LINEA_PASADA}

LINEA_DIV_DOS=$( expr ${LONGITUD_LINEA} / 2 )
TITULO_DIV_DOS=$( expr ${LONGITUD_CARACTER} / 2 )

LONGITUD_DELANTERA=$( expr ${LINEA_DIV_DOS} - ${TITULO_DIV_DOS}   )

PARTE_DELANTERA=$(genera_cadena_espacios ${LONGITUD_DELANTERA} )

echo "${PARTE_DELANTERA}${LINEA_PASADA}${PARTE_DELANTERA}"

#----=----=----=----=----=----=----=----=----=----=----=----=----=--
#- Fin de la funcion
#-------------------------------------------------------------------
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
