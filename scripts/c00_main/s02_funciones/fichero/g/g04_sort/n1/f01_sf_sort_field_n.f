#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- sort_field
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Ordena el fichero indicado por el campo propuesto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sort field file
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sort_field fich_01		-- Ordena el fichero 01 por el primer campo
#-------------------------------------------------------------------
#E sort_field fich_01 3 ";" -- Ordena fich_01 por el tercer campo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias sf
sort_field()
{
IS_sort_field="Ordena el fichero pasado por el campo indicado"
INFO_SCRIPT=${IS_sort_field}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sort_field=${INFO_SCRIPT}

FICHERO=$1
CAMPO=$2
SEPARADOR=$3

SALIDA_sort_field=0

NOMBRE_SCRIPT_sort_field=sort_field
PARAMETROS_SCRIPT_sort_field="FICHERO [CAMPO [SEPARADOR] ]"
NOMBRE_PANTALLA_sort_field=PANTALLA_sort_field.dat

if [ "${FICHERO}" == "" ]; then
FICHERO="-?"
fi

if [ "${CAMPO}" == "" ]; then
CAMPO=1
fi

if [ "${SEPARADOR}" == "" ]; then
SEPARADOR=":"
fi


if [ "${FICHERO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_sort_field} ${PARAMETROS_SCRIPT_sort_field}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar parametros
#-- [2] Ordenar fichero
#--------========--------========--------========--------========---

#-Separador - campo
# -t -k

stat "${FICHERO}" &> /dev/null
SALIDA_stat=$?
SALIDA_sort_field=${SALIDA_stat}

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

sort -t ${SEPARADOR} -k${CAMPO} ${FICHERO} > ${NOMBRE_PANTALLA_sort_field}

MOTIVO_FUNCION="Fichero ordenado correctamente"
PARAMETROS_MOTIVO_01="Fichero              : ${FICHERO}    "
PARAMETROS_MOTIVO_02="Separador            : -${SEPARADOR}-"
PARAMETROS_MOTIVO_03="Campo a ordenar      : ${CAMPO}      "

else
#- No se le pasa usuario

MOTIVO_FUNCION="No se puede acceder al archivo"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion ruta
#----====----====----====----====----====----====----====----====---
fi

#-Establecemos la pantalla tanto para caso favorable o no
PANTALLA_SCRIPT="${NOMBRE_PANTALLA_sort_field}"

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_sort_field}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sort_field}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sort_field}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sort_field}
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

