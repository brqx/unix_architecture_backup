#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.1"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- stamp2date
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Convierte un unix timestamp en formato fecha
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T convertir unix timestamp instantanea fecha
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Fecha
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E stamp2date $unix_timestamp	-	Convierte stamp en fecha
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Instantanea de fecha
stamp2date()
{
IS_stamp2date="Coge una instantanea de la fecha del sistema"
INFO_SCRIPT=${IS_stamp2date}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_stamp2date=${INFO_SCRIPT}

ENTRADA=$1

SALIDA_stamp2date=0

NOMBRE_SCRIPT_stamp2date=stamp2date
PARAMETROS_SCRIPT_stamp2date="Fecha"

if [ "${ENTRADA}" == "-?" ] ; then
	
e_pmt ${NOMBRE_SCRIPT_stamp2date} ${PARAMETROS_SCRIPT_stamp2date}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Generar instantanea
#--------========--------========--------========--------========---

##date -ud "1970-01-01 + 1234567890 seconds"
FECHA_INSTANTANEA=$(date -ud "1970-01-01 + ${ENTRADA} seconds" "+%Y-%m-%d %H:%M:%S")

MOTIVO_FUNCION="Conversion correcta"
PARAMETROS_MOTIVO_01="Stamp de entrada: ${ENTRADA}"
PARAMETROS_MOTIVO_02="Fecha de salida : ${FECHA_INSTANTANEA}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_stamp2date}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_stamp2date}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_stamp2date}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

RETORNO_stamp2date=${FECHA_INSTANTANEA}

return ${SALIDA_stamp2date}
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

