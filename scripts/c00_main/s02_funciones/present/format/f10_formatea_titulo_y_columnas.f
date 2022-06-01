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
#-- formatea_titulo_y_columnas
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
#E formatea_titulo_y_columnas LINEA CON CABECERA	-- Formatea esa linea para poder tratarse
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Debe formatear la entrada para que la salida de la misma sea homogenea
formatea_titulo_y_columnas()
{
IS_formatea_titulo_y_columnas="Decodifica una linea"
INFO_SCRIPT=${IS_formatea_titulo_y_columnas}

INFO=$1


if [ "${NUM_CRC_TITULO}" == "" ]; then
NUM_CRC_TITULO=10
fi

if [ "${NUM_CRC_COLUMNA}" == "" ]; then
NUM_CRC_COLUMNA=10
fi


if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt formatea_titulo_y_columnas "LINEA_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-En principio la entrada llega codificada

#-Vamos a decodificar
dcode "$@"
LINEA_ENTRADA="${SALIDA_DCODE}"
LINEA_PREPARADA=

#-Que ocurre si la cadena es mas larga por cualquier razon - que se embucla

#-Debemos conocer la maxima cadena - Solo entrara aqui si hay alguna cadena mas larga
MAXIMA_CADENA_TITULO=${NUM_CRC_TITULO}
MAXIMA_CADENA_COLUMNA=${NUM_CRC_COLUMNA}

#-Hay que pensar que la primera columna debe ser diferente

cont=0
for i in ${LINEA_ENTRADA} ; do
LON_CADENA=${#i}

if [ "${cont}" -eq "0" ] ; then
#-Caso del titulo
if [ "${LON_CADENA}" -gt "${NUM_CRC_TITULO}" ] ; then
MAXIMA_CADENA_TITULO=${LON_CADENA}
fi
else
#-Caso de la columna
if [ "${LON_CADENA}" -gt "${NUM_CRC_COLUMNA}" ] ; then
MAXIMA_CADENA_COLUMNA=${LON_CADENA}
fi
fi
let cont++
done

#-Partimos con dos maximos, uno para los titulos y otro para las columnas

cont=0
for i in ${LINEA_ENTRADA} ; do

if [ "${cont}" -eq "0" ] ; then
#-Caso del titulo
LON_CADENA=$( expr ${MAXIMA_CADENA_TITULO} - ${#i})
ajusta_cadena_guiones ${LON_CADENA} ${i}
else
#-Caso de la columna
LON_CADENA=$( expr ${MAXIMA_CADENA_COLUMNA} - ${#i})
ajusta_cadena_guiones ${LON_CADENA} ${i}
fi

CADENA_PREPARADA="${SALIDA_ajusta_cadena_guiones}"
LINEA_PREPARADA=${LINEA_PREPARADA}${CADENA_PREPARADA}
let cont++
done

echo ${LINEA_PREPARADA} | tr "_" " " 

#-Esto de momento no nos funciona

##echo ${LINEA_ENTRADA} | gawk -v lin=${LINEA_CODIGOS} '{printf "%6s\n", $1, $2, $3, $4, $5, $6}'

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
