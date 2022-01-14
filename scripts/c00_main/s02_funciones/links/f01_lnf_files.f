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
#E lnf /site/apache apache    -- Lista los procesos de apache
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

lnf()
{
IS_lnf="Enlazador inteligente"
INFO_SCRIPT=${IS_lnf}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_lnf=${INFO_SCRIPT}

REAL_PATH=${1}
LINK_PATH=${2}

SALIDA_lnf=0

NOMBRE_SCRIPT_lnf=lnf
PARAMETROS_SCRIPT_lnf="[RUTA REAL] ENLACE"

if [ "${REAL_PATH}" == "-?"  -o "${REAL_PATH}" == "" ]; then
e_pmt ${NOMBRE_SCRIPT_lnf} ${PARAMETROS_SCRIPT_lnf}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Funcion Simple - No requiere control de funcionamiento

if [ "${LINK_PATH}" != "" ] ; then
unlink ${LINK_PATH}
fi

ln -sf ${REAL_PATH} ${LINK_PATH}
SALIDA_lnf=$?

return ${SALIDA_lnf}
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

