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
#-- date2stamp
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
#E date2stamp "2006-10-01 15:00"	-	Convierte una fecha en un unix timestamp
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Instantanea de fecha
date2stamp()
{
IS_date2stamp="Coge una instantanea de la fecha del sistema"
INFO_SCRIPT=${IS_date2stamp}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_date2stamp=${INFO_SCRIPT}

ENTRADA="$1"

SALIDA_date2stamp=0

NOMBRE_SCRIPT_date2stamp=date2stamp
PARAMETROS_SCRIPT_date2stamp="Fecha"


if [ "${ENTRADA}" == "-?" ] ; then
	
e_pmt ${NOMBRE_SCRIPT_date2stamp} ${PARAMETROS_SCRIPT_date2stamp}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Generar instantanea
#--------========--------========--------========--------========---

##date --utc --date "2009-02-06 09:57:54" +%s
INSTANTANEA=$(date --utc --date "${ENTRADA}" +%s)

MOTIVO_FUNCION="Conversion correcta"
PARAMETROS_MOTIVO_01="Fecha de entrada: ${ENTRADA}"
PARAMETROS_MOTIVO_02="Stamp de salida : ${INSTANTANEA}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_date2stamp}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_date2stamp}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_date2stamp}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

RETORNO_date2stamp=${INSTANTANEA}

return ${SALIDA_date2stamp}
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
