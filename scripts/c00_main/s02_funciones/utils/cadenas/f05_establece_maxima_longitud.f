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
#-- establece_maxima_longitud
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece la maxima longitud para presentar las cadenas
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

#-Establece la maxima longitud de las proximas cadenas a presentar
#-Mini alias setlen
#-Alias setmaxlen
establece_maxima_longitud()
{
IS_establece_maxima_longitud="Establece la maxima longitud de las proximas cadenas a presentar."
INFO_SCRIPT=${IS_establece_maxima_longitud}

INFO=$1

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

#-En el caso de que este vacia la cadena del numero de caracteres, buscaremos la longitud a partir
# de la lista indicada
#-Si ya tiene un valor buscaremos una longitud mayor
if [ "${NUM_CRC}" == "" ]; then
NUM_CRC=0
fi

if [ "${INFO}" == "-?" ]; then

e_pmt establece_maxima_longitud "LINEA_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_ENTRADA="$@"
LINEA_PREPARADA=

#-Analizamos el numero de caracteres maximo
for i in ${LINEA_ENTRADA} ; do

LON_CADENA=$(expr ${#i} + 1 )
if [ "${LON_CADENA}" -gt "${NUM_CRC}" ] ;then
NUM_CRC=${LON_CADENA}
fi
done

##echo "La cadena mas larga mide : ${NUM_CRC} "

SALIDA_establece_maxima_longitud=${NUM_CRC}
return ${NUM_CRC}

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
