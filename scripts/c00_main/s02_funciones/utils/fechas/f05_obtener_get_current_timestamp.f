#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- get_current_timestamp
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- get_current_date
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene una instantanea de la fecha actual en formato timestamp
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T instantanea fecha actual unix timestamp
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_current_timestamp	-	Devuelve la fecha del sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias resta_fechas
get_current_timestamp()
{
IS_get_current_timestamp="Devuelve la diferencia entre dos fechas dadas"
INFO_SCRIPT=${IS_get_current_timestamp}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_current_timestamp=${INFO_SCRIPT}

ENTRADA=$1

SALIDA_get_current_timestamp=0

NOMBRE_SCRIPT_get_current_timestamp=get_current_timestamp
PARAMETROS_SCRIPT_get_current_timestamp="[-?]"


if [ "${ENTRADA}" == "-?" ] ; then
	
e_pmt ${NOMBRE_SCRIPT_get_current_timestamp} ${PARAMETROS_SCRIPT_get_current_timestamp}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Obtener fecha 
#-- [2] Convertir a timestamp
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_date
FECHA_ACTUAL=${RETORNO_get_current_date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

date2stamp "${RETORNO_get_current_date}"
FECHA_INSTANTANEA=${RETORNO_date2stamp}


MOTIVO_FUNCION="Obtenemos la fecha actual"
PARAMETROS_MOTIVO_01="Fecha actual: ${FECHA_ACTUAL}"
PARAMETROS_MOTIVO_02="Instantanea : ${FECHA_INSTANTANEA}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_current_timestamp}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_current_timestamp}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_current_timestamp}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

RETORNO_get_current_timestamp=${FECHA_INSTANTANEA}

return ${SALIDA_get_current_timestamp}
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

