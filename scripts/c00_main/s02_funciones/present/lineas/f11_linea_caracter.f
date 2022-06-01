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
#-- linea_caracter
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_multi_caracter - e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una linea normal de longitud determinada
#-------------------------------------------------------------------
#T generar linea normal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [CARACTER] [LONGITUD]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E linea_caracter 20 =				-- Genera una linea de longitud 20
#-------------------------------------------------------------------
#E linea_caracter 50 _=_ 			-- Genera una linea multicaracter de longitud 50
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias relacionados : 
# linea_guiones - linea_guiones_bajos - linea_subrayados - linea_underscores

#-Genera una linea normal de guiones
linea_caracter()
{
IS_linea_caracter="Genera una linea normal de guiones"
EINFO_SCRIPT=${IS_linea_caracter}


CARACTER="$1"
LONGITUD_PASADA=$2

if [ "${CARACTER}" == "" ]; then
CARACTER="-"
fi

#-Se trata de una variable global para todas las lineas de una presentacion
if [ "${LONGITUD_ESTABLECIDA}" != "" ] ; then
LONGITUD_LINEA=${LONGITUD_ESTABLECIDA}
fi

if [ "${LONGITUD_PASADA}" != "" ]; then
#-Si se indica una longitud entonces se la ponemos
LONGITUD_LINEA=${LONGITUD_PASADA}
fi

#-Segundo en caso de que no exista atenderemos a la entrada via parametro
if [ "${LONGITUD_LINEA}" == "" ]; then
#-Si tampoco se ha indicado nada usaremos 70 como longitud genera para las lineas
LONGITUD_LINEA=${LONGITUD_LINEA_GLOBAL}
fi

if [ "${CARACTER}" == "-?" ]; then

#-Aqui igual hay que usar una funcion especial para los EINFO_SCRIPT
e_pmt linea_caracter "[CARACTER] [LONGITUD]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#----=----=----=----=----=----=----=----=----=----=----=----=----=--

#- Si el caracter es de varias posiciones hay que dividir la longitud
#  entre las mismas

LONGITUD_CARACTER="${#CARACTER}"

LON_POSICION=$( expr ${LONGITUD_LINEA} / ${LONGITUD_CARACTER} )

#- Letras de menos es el resto entre ambas longitudes
LETRAS_DE_MENOS=$( expr ${LONGITUD_LINEA} % ${LONGITUD_CARACTER} )

##echo "${LONGITUD} / ${LONGITUD_CARACTER} - $LETRAS_DE_MENOS"

if [ "$LETRAS_DE_MENOS" -gt "0" ] ; then
CARACTER2=$(echo "$CARACTER" | cut -c1-${LETRAS_DE_MENOS} )
fi
linea_multi_caracter ${LON_POSICION} "${CARACTER}" "${CARACTER2}"

#-Vaciamos las variables
CARACTER=
CARACTER2=

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
