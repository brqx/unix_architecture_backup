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
#-- get_current_date
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene una instantanea de la fecha actual
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T instantanea fecha actual
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Fecha
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_current_date	-	Devuelve la fecha del sistema
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias resta_fechas
get_current_date()
{
IS_get_current_date="Devuelve la diferencia entre dos fechas dadas"
INFO_SCRIPT=${IS_get_current_date}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_current_date=${INFO_SCRIPT}

ENTRADA=$1

SALIDA_get_current_date=0

NOMBRE_SCRIPT_get_current_date=get_current_date
PARAMETROS_SCRIPT_get_current_date="[-?]"


if [ "${FECHA_01}" == "-?" ] ; then
	
e_pmt ${NOMBRE_SCRIPT_get_current_date} ${PARAMETROS_SCRIPT_get_current_date}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Generar instantanea
#--------========--------========--------========--------========---

FECHA_INSTANTANEA=$(date '+%Y-%m-%d %H:%M:%S')

MOTIVO_FUNCION="Obtenemos la fecha actual"
PARAMETROS_MOTIVO_01="Fecha actual: ${FECHA_INSTANTANEA}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_current_date}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_current_date}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_current_date}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

RETORNO_get_current_date=${FECHA_INSTANTANEA}

return ${SALIDA_get_current_date}
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

