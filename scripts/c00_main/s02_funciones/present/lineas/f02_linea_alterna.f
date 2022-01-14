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
#-- linea_alterna
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una linea alterna de longitud determinada
#-------------------------------------------------------------------
#T generar linea alterna
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [LONGITUD] [CARACTER1] [CARACTER2]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E linea_alterna 20				-- Genera una linea de longitud 20
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Genera una linea normal de guiones
linea_alterna()
{
IS_linea_normal="Genera una linea alterna de guiones e iguales o los caracteres que se indiquen"
EINFO_SCRIPT=${IS_linea_normal}

LONGITUD_PASADA=$1
CARACTER=$2
CARACTER2=$3

if [ "${LONGITUD_PASADA}" == ""      ] ; then
if [ "${LONGITUD_ESTABLECIDA}" != "" ] ; then
LONGITUD_LINEA=${LONGITUD_ESTABLECIDA}
fi

#-Primero consideramos que hay un size ya ajustado para todas las lineas
if [ "${LONGITUD_LINEA}" == "" ]; then
LONGITUD_LINEA=${LONGITUD_PASADA}
fi

#-Segundo en caso de que no exista atenderemos a la entrada via parametro
if [ "${LONGITUD_LINEA}" == "" ]; then
#-Si tampoco se ha indicado nada usaremos 70 como longitud genera para las lineas
LONGITUD_LINEA=${LONGITUD_LINEA_GLOBAL}
fi
else
LONGITUD_LINEA=${LONGITUD_PASADA}
fi


if [ "${CARACTER}" == "" ]; then
CARACTER="-"
fi

if [ "${CARACTER2}" == "" ]; then
CARACTER2="="
fi


if [ "${LONGITUD_PASADA}" == "-?" ]; then

#-Aqui va a necesitar una funcion especial para EINFO_SCRIPT
e_pmt linea_normal "LONGITUD"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

longitud_linea_actual=0
LINEA_PREPARADA=

TAB_CARACTER[0]=${CARACTER}
TAB_CARACTER[1]=${CARACTER2}

while [ "${longitud_linea_actual}" -lt "${LONGITUD_LINEA}" ] ; do

MOD_ACTUAL=$(expr $longitud_linea_actual % 2)

CARACTER_ACTUAL=${TAB_CARACTER[${MOD_ACTUAL}]}

LINEA_PREPARADA="${LINEA_PREPARADA}${CARACTER_ACTUAL}"

let longitud_linea_actual++
done

echo ${LINEA_PREPARADA}

#-Vaciamos las variables
LINEA_PREPARADA=
LONGITUD=
CARACTER=
CARACTER2=

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
