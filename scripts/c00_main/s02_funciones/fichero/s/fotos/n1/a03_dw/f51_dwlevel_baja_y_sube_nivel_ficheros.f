#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
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
#-- dwlevel
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube de nivel todos los ficheros del nivel N concatenandolos ruta final
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [nivel] [corte_cadena_ruta] [corte_cadena_fichero]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dwlevel 3 -- Genera una copia de los ficheros que se encuentren en el nivel 3
#-------------------------------------------------------------------
#E dwlevel 2 4 4 -- Copia ficheros nivel 2 dejando el padre en 4 caracteres y los ficheros en 4 y la extension
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias dwl
dwlevel()
{
IS_dwlevel="Copia ficheros desde el nivel N al actual contador en nivel superior concatenando ruta padre"
INFO_SCRIPT=${IS_dwlevel}

#- Si acortamos la ruta no tiene sentido usar una cadena
#- Por defecto :
#-- No cortamos ruta
#-- cortamos el nombre del fichero a 15 repetando la extension

NIVEL_PASADO=$1
CORTE_CADENA_RUTA=$2
CORTE_CADENA_ARCHIVO=$3


if [ "${NIVEL_PASADO}" == "" ]; then
#-Si no se pasa cadena pasamos el segundo nivel para que busque en todas las carpetas
NIVEL_PASADO=2
fi

#-Habilitamos el corte de la cadena
if [ "${CORTE_CADENA_ARCHIVO}" == "" ]; then
#- Con la extension cogemos cualquier formato jpg jpeg incluido el punto
CORTE_CADENA_ARCHIVO=15
fi


if [ "${NIVEL_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt dwlevel "[nivel] [corte_cadena_ruta] [corte_cadena_fichero]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Igual es interesante reducir la cadena a N caracteres

cont=0
nivel_fichero=$( expr ${NIVEL_PASADO} + 1 )

for i in $(find -maxdepth ${NIVEL_PASADO} -mindepth ${NIVEL_PASADO} -type f  )
do

PADRE_REAL=$(echo $i | cut -d "/" -f${NIVEL_PASADO} )

#- Cortamos el padre
PADRE_CORTADO=$(echo ${PADRE_REAL} | cut -c1-${CORTE_CADENA_RUTA})

FICHERO_REAL=$(echo $i | cut -d "/" -f${nivel_fichero} )

#-Ahora debemos tratar la extension

LONGITUD_CADENA=${#FICHERO_REAL}
DISTANCIA_EXTENSION=$(expr $LONGITUD_CADENA - 5 )

#- Con la extension cogemos cualquier formato jpg jpeg incluido el punto
#  Con este formato permitimos que los ficheros tengan punto

EXTENSION=${FICHERO_REAL:${DISTANCIA_EXTENSION}:${LONGITUD_CADENA}}
RESTO_ARCHIVO=${FICHERO_REAL:0:${DISTANCIA_EXTENSION}}


#- Aqui cortamos N caracteres del fichero
CADENA_FINAL=$(echo ${RESTO_ARCHIVO} | cut -c1-${CORTE_CADENA_ARCHIVO})

FICHERO_CORTADO=${CADENA_FINAL}_${cont}_${EXTENSION}

##echo "Padre: ${PADRE_REAL} Fichero: ${FICHERO_REAL}"
##echo "Padre: ${PADRE_CORTADO} Fichero ${FICHERO_CORTADO}"

FICHERO_COMPUESTO=${PADRE_CORTADO}-${FICHERO_CORTADO}
cp $i ${FICHERO_COMPUESTO}
let cont++

done

#- Vaciamos variables que pueden quedar 
CORTE_CADENA_RUTA=
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
