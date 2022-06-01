#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- contlevel
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cuenta los niveles que hay hasta los ficheros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cuenta niveles carpetas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E contlevel    -- Cuenta niveles que hay hasta los ficheros
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- uplevel - Cont level
contlevel()
{
IS_contlevel="Cuenta niveles que hay hasta los ficheros"
INFO_SCRIPT=${IS_contlevel}

INFO_SCRIPT_contlevel=${INFO_SCRIPT}

CADENA=$1

SALIDA_contlevel=0

NOMBRE_SCRIPT_contlevel=contlevel
PARAMETROS_SCRIPT_contlevel="[cadena]"


if [ "${CADENA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_contlevel} ${PARAMETROS_SCRIPT_contlevel}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Averiguamos los niveles - le quitamos letras numeros y caracteres

NUM_FICHEROS=$(find . -type f | wc -l)

if [ ${NUM_FICHEROS} -gt 0 ]; then
#--------========--------========--------========--------========---
#------- [1] Inicio hay ficheros
#--------========--------========--------========--------========---

CADENA_NIVELES=$(find . -type f | head -1 | \
sed "s/[a-z]//g" |  sed "s/[A-Z]//g" | sed "s/[0-9]//g" | \
sed "s/-//g" | sed "s/_//g" |sed "s/\.//g" )

NIVELES=$(echo ${CADENA_NIVELES} | wc -c )


let NIVELES--
let NIVELES--

if [ "${CADENA_NIVELES}" != "" ]; then
#--------========--------========--------========--------========---
#--------- [2] Inicio Niveles
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Hay ficheros en la ruta"
PARAMETROS_MOTIVO_01="Ruta    : ${PWD}"
PARAMETROS_MOTIVO_02="Cadena  : ${CADENA_NIVELES}"
PARAMETROS_MOTIVO_03="Niveles : ${NIVELES}"

SALIDA_contlevel=0

else

MOTIVO_FUNCION="No hay ficheros en la ruta.Check Niveles"
PARAMETROS_MOTIVO_01="Ruta    : ${PWD}"

SALIDA_contlevel=1

#--------========--------========--------========--------========---
#--------- [2] Fin Niveles
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="No hay ficheros en la ruta"
PARAMETROS_MOTIVO_01="Ruta    : ${PWD}"

SALIDA_contlevel=2

#--------========--------========--------========--------========---
#------- [1] Fin hay ficheros
#--------========--------========--------========--------========---
fi




if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_contlevel}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_contlevel}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_contlevel}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


RETORNO_num_niveles=${NIVELES}

return ${SALIDA_contlevel}
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
