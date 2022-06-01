#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
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
#-- establece_longitud_titulo_y_columnas
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece la maxima longitud para presentar las cadenas
#-------------------------------------------------------------------
#+ Informacion adiccional - adds : 
#-------------------------------------------------------------------
#A suele usarse con formatea_titulo_y_columnas
#-------------------------------------------------------------------
#T establecer set max maxima longitud
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_ENTRADA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E establece_maxima_longitud LINEA A CC	-- Establece la maxima longitud en 6
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

establece_longitud_titulo_y_columnas()
{
IS_establece_longitud_titulo_y_columnas="Establece la maxima longitud de las proximas cadenas a presentar."
INFO_SCRIPT=${IS_establece_longitud_titulo_y_columnas}

INFO=$1

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt establece_longitud_titulo_y_columnas "LINEA_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_ENTRADA="$@"
LINEA_PREPARADA=

#-Vamos a preparar las longitudes
NUM_CRC_TITULO=0
NUM_CRC_COLUMNA=0

#-Analizamos el numero de caracteres maximo
cont=0
for i in ${LINEA_ENTRADA} ; do
LON_CADENA=$(expr ${#i} + 2 )

if [ "${cont}" -eq "0" ] ; then
#-Caso del titulo
if [ "${LON_CADENA}" -gt "${NUM_CRC_TITULO}"  ] ;then
NUM_CRC_TITULO=${LON_CADENA}
fi
else
#-Caso de la columna
if [ "${LON_CADENA}" -gt "${NUM_CRC_COLUMNA}" ] ;then
NUM_CRC_COLUMNA=${LON_CADENA}
fi
fi
let cont++
done

#-La salida es dejar configuradas las longitudes del titulo y columnas
##echo "Titulo : ${NUM_CRC_TITULO} " 
##echo "Columnas : ${NUM_CRC_COLUMNA} "
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
