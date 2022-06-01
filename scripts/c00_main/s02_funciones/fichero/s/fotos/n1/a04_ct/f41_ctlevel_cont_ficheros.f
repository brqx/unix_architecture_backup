#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- contlevel
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube de nivel todos los ficheros y cambia su nombre por un contador concatenando ruta
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cadena] [corte_cadena_ruta] [corte_cadena_archivo]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E contlevel AA 3 -- Genera una copia de los ficheros en un nivel superior
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- uplevel - Cont level
uclevel()
{
IS_contlevel="Copia ficheros como contador a un nivel superior concatenando ruta padre"
INFO_SCRIPT=${IS_contlevel}

CORTE_CADENA_RUTA=$1
CORTE_CADENA_ARCHIVO=$2
CADENA=$3


if [ "${CADENA}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
CADENA=$(basename $PWD)
fi

#-Habilitamos el corte de la cadena
if [ "${CORTE_CADENA_ARCHIVO}" == "" ]; then
#- Con la extension cogemos cualquier formato jpg jpeg incluido el punto
CORTE_CADENA_ARCHIVO=5
fi


if [ "${CORTE_CADENA_RUTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt contlevel "[cadena]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Igual es interesante reducir la cadena a N caracteres


#-- Cortamos N posiciones la cadena
CADENA_FINAL=$(echo ${CADENA} | cut -c1-${CORTE_CADENA_RUTA} )

cont=0
#- ${[variableName]:[startIndex]:[length]}
##  echo ${str::${#str}-20}
#- Debe iterar solo ficheros
for i in $(find -maxdepth 1 -type f | cut -d "/" -f2 )
do
#echo "Ruta destino : $i ../${CADENA}-${i} "

LONGITUD_CADENA=${#i}

NUM_CARACTERES=$(expr ${LONGITUD_CADENA} - ${CORTE_CADENA_ARCHIVO} )

#- Con la extension cogemos cualquier formato jpg jpeg incluido el punto
EXTENSION=${i:${NUM_CARACTERES}:${LONGITUD_CADENA}}

NOMBRE_CONT=${cont}${EXTENSION}
cp $i ../${CADENA_FINAL}-${NOMBRE_CONT}

let cont++
done

fi

}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
