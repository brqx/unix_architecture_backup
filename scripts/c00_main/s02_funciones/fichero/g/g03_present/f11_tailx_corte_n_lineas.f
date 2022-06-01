#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
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
#-- tailx
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace un listado de las ultimas lineas de un archivo
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado lineas archivo tail
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [LINEAS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E tailx     -- Listado ultimas 10 lineas del archivo
#-------------------------------------------------------------------
#E tailx  20 -- Listado ultimas 20 lineas del archivo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

tailx()
{
IS_tailx="Informa de las ultimas lineas del archivo"
INFO_SCRIPT=${IS_tailx}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_tailx=${INFO_SCRIPT}

ARCHIVO=${1}
NUM_LINEAS=${2}

SALIDA_tailx=0

NOMBRE_SCRIPT_tailx=tailx
PARAMETROS_tailx="[NUM_LINEAS]"

if [ "${ARCHIVO}" == "" ]; then
ARCHIVO="-?"
fi


if [ "${NUM_LINEAS}" == "" ]; then
NUM_LINEAS="10"
fi

if [ "${ARCHIVO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_tailx} ${PARAMETROS_SCRIPT_tailx}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

stat "${ARCHIVO}" &> /dev/null
SALIDA_stat=$?
SALIDA_tailx=${SALIDA_stat}

#-Parametros comunes
PARAMETROS_MOTIVO_01="Archivo      : ${ARCHIVO}"
PARAMETROS_MOTIVO_02="Lineas       : ${NUM_LINEAS}"

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Listado lineas archivo de forma correcta"
tail -${NUM_LINEAS} ${ARCHIVO}

else

MOTIVO_FUNCION="Error al acceder al archivo"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_tailx}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_tailx}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_tailx}

ef_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_tailx}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi



}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

