#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2016"
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
#-- repf
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reemplaza ficheros en base a parametros
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T replace files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [CAMPO] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E repf fichero_aa aa bb	-- repfombra fichero_aa por fichero_bb
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias sf
repf()
{
IS_repf="Reemplaza el interior del fichero con los argumentos indicados indicado"
INFO_SCRIPT=${IS_repf}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_repf=${INFO_SCRIPT}

CADENA=$1
CAMBIO=$2
FICHERO=$3


SALIDA_repf=0

NOMBRE_SCRIPT_repf=repf
PARAMETROS_SCRIPT_repf="FICHERO [CADENA] [CAMBIO]"
NOMBRE_PANTALLA_repf=PANTALLA_repf.dat

if [ "${CADENA}" == "" ]; then
CADENA="aa"
fi

if [ "${CAMBIO}" == "" ]; then
CAMBIO="bb"
fi


if [ "${CADENA}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_repf} ${PARAMETROS_SCRIPT_repf}

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
SALIDA_repf=${SALIDA_stat}

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

##NEW_FILE=$( echo ${FICHERO} | tr "${CADENA}" "${CAMBIO}"  )
sed -i "s/${CADENA}/${CAMBIO}/g"  ${FICHERO} 

MOTIVO_FUNCION="Fichero reemplazado correctamente"
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

if [ "${SW_SHOW}" == "1" -a "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_repf}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_repf}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_repf}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_repf}
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

