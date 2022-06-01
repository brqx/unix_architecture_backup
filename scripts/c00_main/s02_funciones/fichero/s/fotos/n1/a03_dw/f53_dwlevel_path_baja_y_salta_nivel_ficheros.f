#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
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
#-- dwlevel_path
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube de nivel todos los ficheros actuales cocatenandolos ruta final
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [corte_cadena] [cadena] [ruta_final] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uplevel_path /opt  -- Genera una copia de los ficheros en /opt
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias uplp
dwlevel_path()
{
IS_uplevel_path="Copia ficheros a una ruta especifica con subida nivelado"
INFO_SCRIPT=${IS_uplevel_path}

CORTE_CADENA_RUTA=$1
CORTE_CADENA_ARCHIVO=$2
CADENA=$3
RUTA_PASADA=$4

#-Habilitamos el corte de la cadena
if [ "${CORTE_CADENA_ARCHIVO}" == "" ]; then
#- Con la extension cogemos cualquier formato jpg jpeg incluido el punto
CORTE_CADENA_ARCHIVO=0
fi


if [ "${CADENA}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
CADENA=$(basename $PWD)
fi

if [ "${RUTA_PASADA}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
RUTA_PASADA=../
fi

if [ "${CORTE_CADENA_RUTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt uplevel_path "[corte_cadena_ruta] [corte_cadena_fichero] [cadena] [ruta] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-- Cortamos N posiciones la cadena
CADENA_FINAL=$(echo ${CADENA} | cut -c1-${CORTE_CADENA_RUTA} )

#- Debe iterar solo ficheros
for i in $(find -maxdepth 1 -type f | cut -d "/" -f2 )
do
#echo "Ruta destino : $i ../${CADENA}-${i} "

LONGITUD_CADENA=${#i}

NUM_CARACTERES=$(expr ${LONGITUD_CADENA} - ${CORTE_CADENA_ARCHIVO} )

NOMBRE_ARCHIVO_CORTADO=${i:${NUM_CARACTERES}:${LONGITUD_CADENA}}

cp $i ${RUTA_PASADA}/${CADENA_FINAL}-${NOMBRE_ARCHIVO_CORTADO}
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
