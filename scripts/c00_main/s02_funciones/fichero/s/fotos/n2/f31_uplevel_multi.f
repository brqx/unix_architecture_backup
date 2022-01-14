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
#-- uplevel_multi
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- uplevel
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube N niveles todos los ficheros actuales cocatenandolos ruta final
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [niveles] [cadena]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uplevel_multi 2  -- Genera una copia de los ficheros en dos niveles superior
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias uplmul
uplevel_multi()
{
IS_uplevel_multi="Copia ficheros a un nivel superior concatenendo cadenas"
INFO_SCRIPT=${IS_uplevel_multi}

NIVELES=$1
CADENA_N2=$2
CORTE_CADENA=$3


if [ "${NIVELES}" == "" ]; then
NIVELES=1
fi


if [ "${CADENA_N2}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
CADENA_N2=$(basename $PWD)
fi

if [ "${NIVELES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt uplevel_multi "[niveles] [cadena] [corte_cadena]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Va a subir los ficheros dos niveles

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

cont_niveles=0

while [ ${cont_niveles} -lt ${NIVELES} ] ; do
##echo "Lanzamos uplevel : $PWD "
uplevel ${CADENA_N2} ${CORTE_CADENA}
cd ..
##sleep 10
##echo "vamos a lanzarlo en $PWD "
let cont_niveles++
done

#- Debe dejar solo los de nivel superior
#- estamos a nivel superior y sabemos como volver

#- Volvemos a la ruta inicial

cd ${RUTA_ACTUAL}

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
