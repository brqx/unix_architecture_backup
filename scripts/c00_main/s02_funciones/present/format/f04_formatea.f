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
#-- formatea
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Formatea la entrada para generar una salida homogenea
#-------------------------------------------------------------------
#T formato formatear linea entrada
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_A_FORMATEAR
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E formatea LINEA				-- Formatea esa linea para poder tratarse
#-------------------------------------------------------------------
#E NUM_CRC=20 && formatea LINEA -- Formatea esa linea con separacion de 20
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Debe formatear la entrada para que la salida de la misma sea homogenea
formatea()
{
IS_formatea="Decodifica una linea"
INFO_SCRIPT=${IS_formatea}

INFO=$1


if [ "${NUM_CRC}" == "" ]; then
NUM_CRC=10
fi

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt formatea "LINEA_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_ENTRADA="$@"
LINEA_PREPARADA=

#-Que ocurre si la cadena es mas larga por cualquier razon - que se embucla

#-Debemos conocer la maxima cadena - Solo entrara aqui si hay alguna cadena mas larga
MAXIMA_CADENA=${NUM_CRC}

#-Hay que pensar que la primera columna debe ser diferente

for i in ${LINEA_ENTRADA} ; do
LON_CADENA=${#i}

if [ "${LON_CADENA}" -gt "${NUM_CRC}" ] ; then
MAXIMA_CADENA=${LON_CADENA}
fi
done

#-Partimos con dos maximos, uno para los titulos y otro para las columnas

for i in ${LINEA_ENTRADA} ; do

LON_CADENA=$( expr ${MAXIMA_CADENA} - ${#i})
ajusta_cadena_guiones ${LON_CADENA} ${i}

CADENA_PREPARADA="${SALIDA_ajusta_cadena_guiones}"
LINEA_PREPARADA=${LINEA_PREPARADA}${CADENA_PREPARADA}
let cont++
done

#-Esta parte igual hay que cambiarla
echo ${LINEA_PREPARADA} | tr "_" " " 

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
