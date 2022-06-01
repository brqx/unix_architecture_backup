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
#-- lnf
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
#E lnl /site/apache apache    -- Lista los procesos de apache
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

lnl()
{
IS_lnl="Enlazador inteligente. Defecto files"
INFO_SCRIPT=${IS_lnl}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lnl=${INFO_SCRIPT}

REAL_PATH=${1}

SALIDA_lnl=0

NOMBRE_SCRIPT_lnl=lnl
PARAMETROS_SCRIPT_lnl="[RUTA REAL] files"

if [ "${REAL_PATH}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_lnl} ${PARAMETROS_SCRIPT_lnl}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINK_PATH="./files"

lnf ${REAL_PATH} ${LINK_PATH}

SALIDA_lnl=${SALIDA_lnf}

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

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

