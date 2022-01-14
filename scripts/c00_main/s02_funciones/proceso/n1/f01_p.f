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
#-- p
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
#E p apache    -- Lista los procesos de apache
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

p()
{
IS_p="Listador de procesos"
INFO_SCRIPT=${IS_p}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_p=${INFO_SCRIPT}

FILTRO_PASADO=${1}

SALIDA_p=0

NOMBRE_SCRIPT_p=p
PARAMETROS_SCRIPT_p="[FILTRO_PROCESOS]"

if [ "${FILTRO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_p} ${PARAMETROS_SCRIPT_p}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Funcion Simple - No requiere control de funcionamiento

ps -eaf | grep "${FILTRO_PASADO}" | grep -v "grep" 2> /dev/null ;
SALIDA_p=$?

return ${SALIDA_p}
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

