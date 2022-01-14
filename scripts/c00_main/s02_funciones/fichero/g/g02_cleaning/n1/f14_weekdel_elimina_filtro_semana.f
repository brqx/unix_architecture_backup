#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
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
#-- weekdel
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Vacia el ficheros antiguos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T vacia fichero log vaciar antiguos semanales
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [NUM_DIAS] [RUTA_PASADA]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E weekdel 7 /ruta/ficheros -- Vacia el ficheros semanales - mas viejos que 7 dias en ruta pasada
#-------------------------------------------------------------------
#E weekdel					-- Vacia el ficheros semanales - mas viejos que 7 dias en ruta actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


weekdel()
{
IS_weekdel="Vacia el ficheros mas viejos que la fecha indicada"
INFO_SCRIPT=${IS_weekdel}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_weekdel=${INFO_SCRIPT}

NUM_DIAS=${1}
##FILTRO=${2}
RUTA_PASADA=${2}

SALIDA_weekdel=0

NOMBRE_SCRIPT_weekdel=weekdel
PARAMETROS_SCRIPT_weekdel="[NUM_DIAS] [RUTA_PASADA]"

if [ "${NUM_DIAS}" == "" ]; then
## Activamos una semana por defecto
NUM_DIAS="7"
fi  

if [ "${RUTA_PASADA}" == "" ]; then
## Activamos una ruta por defecto
RUTA_PASADA="${PWD}"
fi  

if [ "${NUM_DIAS}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_weekdel} ${PARAMETROS_SCRIPT_weekdel}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar ruta y accesibilidad
#-- [2] Chequear cumplimento del filtro de fecha
#-- [3] Vaciar fichero
#--------========--------========--------========--------========---

stat "${RUTA_PASADA}" &> /dev/null
SALIDA_stat=$?
SALIDA_weekdel=${SALIDA_stat}

USUARIO_ACTUAL=$(whoami)

#-Parametros comunes
PARAMETROS_MOTIVO_01="Ruta pasada		  : ${RUTA_PASADA}"
PARAMETROS_MOTIVO_02="Numero de dias      : ${NUM_DIAS}"
PARAMETROS_MOTIVO_03="Ruta actual         : ${PWD}"
PARAMETROS_MOTIVO_04="Propietario actual  : ${USUARIO_ACTUAL}"

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

find ${RUTA_PASADA} -type f  -mtime +${NUM_DIAS} | xargs rm -f
SALIDA_vaciado=$?


if [ "${SALIDA_vaciado}" == "0" ] ; then
#---------=========---------=========---------=========---------====
#----- [2] Inicio check vaciado
#---------=========---------=========---------=========---------====

MOTIVO_FUNCION="Fichero existe ha sido vaciado"

else

MOTIVO_FUNCION="Error de permisos"

#---------=========---------=========---------=========---------====
#----- [2] Fin check vaciado
#---------=========---------=========---------=========---------====
fi
else

MOTIVO_FUNCION="Ruta incorrecta"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_weekdel}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_weekdel}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_weekdel}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_weekdel}
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

