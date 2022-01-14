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
#-- linea_normal
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_multi_caracter
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
#E linea_normal 20				-- Genera una linea de longitud 20
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias relacionados : 
# linea_guiones - linea_guiones_bajos - linea_subrayados - linea_underscores

#-Genera una linea normal de guiones
linea_normal()
{
IS_linea_normal="Genera una linea normal de guiones"
EINFO_SCRIPT=${IS_linea_normal}

LONGITUD_PASADA=$1
CARACTER=$2

#-Lo que esta claro es que si le pasamos una longitud debe usarla


#-Atendemos a la longitud pasada
if [ "${LONGITUD_PASADA}" != "" ]; then

LONGITUD_LINEA=${LONGITUD_PASADA}
else

if [ "${LONGITUD_ESTABLECIDA}" != "" ] ; then
LONGITUD_LINEA=${LONGITUD_ESTABLECIDA}
fi

fi

#-Segundo en caso de que no exista atenderemos a la entrada via parametro
if [ "${LONGITUD_LINEA}" == "" ]; then
#-Si tampoco se ha indicado nada usaremos 70 como longitud genera para las lineas
LONGITUD_LINEA=${LONGITUD_LINEA_GLOBAL}
fi

if [ "${CARACTER}" == "" ]; then
CARACTER="-"
fi

LONGITUD_CARACTER=${#CARACTER}

if [ "${LONGITUD_CARACTER}" -gt "1" ]; then
CARACTER="-?"
MENSAJE_FUNCION="No se admiten caracteres de mas de una posicion"
fi

if [ "${CARACTER}" == "-?" ]; then

##e_pmt2 linea_normal "LONGITUD"
#- Ya llevara implicito el mensaje de la funcion

#-Funcion especial para EINFO_SCRIPT

e_pmt linea_normal "[CARACTER] [LONGITUD]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- En lineas normales no hay dos caracteres
CARACTER2=

#- Llamamos a linea multi caracter con un guion
linea_multi_caracter ${LONGITUD_LINEA} ${CARACTER} ${CARACTER2}

fi

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
