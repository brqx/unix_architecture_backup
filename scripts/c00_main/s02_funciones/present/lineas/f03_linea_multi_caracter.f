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
#-- linea_multi_caracter
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una linea con caracter2 y concatena el caracter2
#-------------------------------------------------------------------
#T generar linea multi caracter
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LONGITUD CARACTER_01 CARACTER_02
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E linea_multi_caracter 20 Ax y		-- Genera una linea de longitud 41 (AxAx..y)
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Genera una linea con caracter2 y concatena el caracter2
linea_multi_caracter()
{
IS_linea_multi_caracter="Genera una linea con caracter2 y concatena el caracter2"
INFO_SCRIPT=${IS_linea_multi_caracter}

LONGITUD_PASADA=$1

#-Primer caracter
CARACTER="$2"

#-Se prepara para linea multi caracter y que se conserve la longitud
CARACTER2="$3"

#-Antes hay que atender a la longitud pasada
if [ "${LONGITUD_PASADA}" != "" ]; then
LONGITUD_LINEA=${LONGITUD_PASADA}
fi

#-Segundo en caso de que no exista atenderemos a la entrada via parametro
if [ "${LONGITUD_LINEA}" == "" ]; then
#-Si tampoco se ha indicado nada usaremos 70 como longitud genera para las lineas
LONGITUD_LINEA=${LONGITUD_LINEA_GLOBAL}
fi

if [ "${CARACTER}" == "" ]; then
CARACTER="-"
fi

#-El segundo caracter igual no debe enviarse
if [ "${CARACTER2}" == "" ]; then
CARACTER2=""
fi


if [ "${LONGITUD_PASADA}" == "-?" ]; then

##e_pmt2 linea_normal "LONGITUD"
#- Ya llevara implicito el mensaje de la funcion

e_pmt linea_multi_caracter "LONGITUD" 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

longitud_linea_actual=0
LINEA_PREPARADA=
while [ "${longitud_linea_actual}" -lt "${LONGITUD_LINEA}" ] ; do

LINEA_PREPARADA="${LINEA_PREPARADA}${CARACTER}"

let longitud_linea_actual++
done
LINEA_PREPARADA="${LINEA_PREPARADA}${CARACTER2}"

echo "${LINEA_PREPARADA}"

#-Vaciamos las variables
LONGITUD_LINEA=
LINEA_PREPARADA=
CARACTER=
CARACTER2=


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
