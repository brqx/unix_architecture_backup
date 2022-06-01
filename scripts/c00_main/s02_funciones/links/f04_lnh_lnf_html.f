#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.1"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
STATUS_SCRIPT="checking"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- lnh
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los procesos del sistema y permite filtrarlos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado procesos sistema
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [filtro_procesos]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lnh /site/apache apache    -- Lista los procesos de apache
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

lnh()
{
IS_lnh="Enlazador inteligente. Defecto index.html - index htm - zindez.html"
INFO_SCRIPT=${IS_lnh}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lnh=${INFO_SCRIPT}

REAL_PATH=${1}

SALIDA_lnh=0

NOMBRE_SCRIPT_lnh=lnh
PARAMETROS_SCRIPT_lnh="[RUTA REAL] files"

if [ "${REAL_PATH}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_lnh} ${PARAMETROS_SCRIPT_lnh}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINK_PATH="./zindex.html"

lnf ${REAL_PATH} ${LINK_PATH}

lnf ${LINK_PATH} "./index.html"

lnf ${LINK_PATH} "./index.htm"

DIRNAME=$(dirname $REAL_PATH)

cha
echo "chow ${DIRNAME}"

SALIDA_lnh=${SALIDA_lnf}

return ${SALIDA_lnc}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

