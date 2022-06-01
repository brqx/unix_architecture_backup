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
#-- ref
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I refombra ficheros en base a parametros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ref refame files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ref fichero_aa aa bb	-- refombra fichero_aa por fichero_bb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias sf
ref()
{
IS_ref="Renombra fichero pasado con los argumentos indicados indicado"
INFO_SCRIPT=${IS_ref}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ref=${INFO_SCRIPT}

CADENA=$1
CAMBIO=$2
FICHERO=$3


SALIDA_ref=0

NOMBRE_SCRIPT_ref=ref
PARAMETROS_SCRIPT_ref="FICHERO [CADENA] [CAMBIO]"
NOMBRE_PANTALLA_ref=PANTALLA_ref.dat

if [ "${CADENA}" == "" ]; then
CADENA="aa"
fi

if [ "${CAMBIO}" == "" ]; then
CAMBIO="bb"
fi


if [ "${1}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_ref} ${PARAMETROS_SCRIPT_ref}

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

stat "${FICHERO}" &> /dev/null
SALIDA_stat=$?
SALIDA_ref=${SALIDA_stat}

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

##NEW_FILE=$( echo ${FICHERO} | tr "${CADENA}" "${CAMBIO}"  )
NEW_FILE=$( echo "${FICHERO}" | sed "s/${CADENA}/${CAMBIO}/g"  )

mv ${FICHERO} ${NEW_FILE} 2> /dev/null

MOTIVO_FUNCION="Fichero renombrado correctamente"
PARAMETROS_MOTIVO_01="Fichero              : ${FICHERO}    "
PARAMETROS_MOTIVO_02="Cadena            : ${CADENA}"
PARAMETROS_MOTIVO_03="Cambio           : ${CAMBIO}      "

else
#- No se le pasa usuario

MOTIVO_FUNCION="No se puede acceder al archivo"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion ruta
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ref}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ref}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ref}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_ref}
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

